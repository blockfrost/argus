use std::time::Duration;

use gasket::{daemon::Daemon, messaging::tokio::connect_ports, runtime::spawn_stage};
use miette::IntoDiagnostic;

use crate::IndexerConfig;

#[derive(clap::Args)]
pub struct Args {
    /// Database URL, this will take priority over the one in the .env file
    #[clap(long)]
    pub database_url: Option<String>,
}

impl Args {
    pub fn exec(self) -> miette::Result<()> {
        let indexer_config = IndexerConfig::load().into_diagnostic()?;

        let database_url = self
            .database_url
            .unwrap_or_else(|| indexer_config.database_url.clone());

        tracing::info!("starting argus");
        tracing::info!("{:#?}", indexer_config);

        let mut source = source::Stage::new(indexer_config.dolos_endpoint.clone());
        let mut sink = sink::Stage::new(database_url);

        let retries = gasket::retries::Policy {
            max_retries: 20,
            backoff_unit: Duration::from_secs(1),
            backoff_factor: 2,
            max_backoff: Duration::from_secs(60),
            dismissible: false,
        };

        let policy = gasket::runtime::Policy {
            tick_timeout: None,
            bootstrap_retry: retries.clone(),
            work_retry: retries.clone(),
            teardown_retry: retries.clone(),
        };

        connect_ports(&mut source.output, &mut sink.input, 100);

        let tethers = vec![
            spawn_stage(source, policy.clone()),
            spawn_stage(sink, policy),
        ];

        let daemon = Daemon::new(tethers);

        daemon.block();

        tracing::info!("argus is stopping");

        Ok(())
    }
}

mod utils {
    use gasket::messaging::{InputPort, Message, OutputPort};
    use utxorpc::spec::{cardano::Block, sync::BlockRef};

    pub type SourceOutputPort = OutputPort<ChainEvent>;
    pub type SinkInputPort = InputPort<ChainEvent>;
    pub type SinkCursorPort = OutputPort<()>;

    #[derive(Debug, Clone)]
    pub enum ChainEvent {
        Apply(Block),
        Reset(BlockRef),
    }

    impl ChainEvent {
        pub fn apply(block: Block) -> Message<Self> {
            Message {
                payload: ChainEvent::Apply(block),
            }
        }

        pub fn reset(block_ref: BlockRef) -> Message<Self> {
            Message {
                payload: ChainEvent::Reset(block_ref),
            }
        }
    }
}

mod source {
    use gasket::framework::*;
    use utxorpc::{spec::sync::BlockRef, CardanoSyncClient, ClientBuilder, TipEvent};

    use super::utils::*;

    pub struct Worker {
        stream: utxorpc::LiveTip<utxorpc::Cardano>,
    }

    #[async_trait::async_trait(?Send)]
    impl gasket::framework::Worker<Stage> for Worker {
        async fn bootstrap(stage: &Stage) -> Result<Self, WorkerError> {
            tracing::debug!("connecting to dolos");

            let builder = ClientBuilder::new()
                .uri(stage.dolos_endpoint.as_str())
                .or_panic()?;

            let mut client = builder.build::<CardanoSyncClient>().await;

            let stream = client.follow_tip(vec![]).await.or_restart()?;

            Ok(Self { stream })
        }

        async fn schedule(
            &mut self,
            _stage: &mut Stage,
        ) -> Result<WorkSchedule<TipEvent<utxorpc::Cardano>>, WorkerError> {
            let event = self.stream.event().await.or_restart()?;

            Ok(WorkSchedule::Unit(event))
        }

        async fn execute(
            &mut self,
            unit: &TipEvent<utxorpc::Cardano>,
            stage: &mut Stage,
        ) -> Result<(), WorkerError> {
            tracing::info!("{:#?}", unit);

            match unit {
                TipEvent::Apply(block) => {
                    let parsed = block.parsed.as_ref().ok_or(WorkerError::Panic)?;

                    stage
                        .output
                        .send(ChainEvent::apply(parsed.clone()))
                        .await
                        .or_panic()?;
                }
                TipEvent::Undo(block) => {
                    let parsed = block.parsed.as_ref().ok_or(WorkerError::Panic)?;

                    let header = parsed.header.as_ref().ok_or(WorkerError::Panic)?;

                    let block_ref = BlockRef {
                        index: header.slot,
                        hash: header.hash.clone(),
                    };

                    stage
                        .output
                        .send(ChainEvent::reset(block_ref))
                        .await
                        .or_panic()?;
                }
                TipEvent::Reset(block_ref) => {
                    stage
                        .output
                        .send(ChainEvent::reset(block_ref.clone()))
                        .await
                        .or_panic()?;
                }
            }

            Ok(())
        }
    }

    #[derive(Stage)]
    #[stage(
        name = "source-utxorpc",
        unit = "TipEvent<utxorpc::Cardano>",
        worker = "Worker"
    )]
    pub struct Stage {
        dolos_endpoint: String,

        pub output: SourceOutputPort,

        #[metric]
        ops_count: gasket::metrics::Counter,

        #[metric]
        chain_tip: gasket::metrics::Gauge,

        #[metric]
        current_slot: gasket::metrics::Gauge,
    }

    impl Stage {
        pub fn new(dolos_endpoint: String) -> Self {
            Self {
                dolos_endpoint,
                output: Default::default(),
                ops_count: Default::default(),
                chain_tip: Default::default(),
                current_slot: Default::default(),
            }
        }
    }
}

mod sink {
    use gasket::framework::*;
    use sqlx::MySqlPool;

    use super::utils::*;

    pub struct Worker {
        pool: MySqlPool,
    }

    #[async_trait::async_trait(?Send)]
    impl gasket::framework::Worker<Stage> for Worker {
        async fn bootstrap(stage: &Stage) -> Result<Self, WorkerError> {
            let pool = MySqlPool::connect(&stage.database_url).await.or_retry()?;

            Ok(Self { pool })
        }

        async fn schedule(
            &mut self,
            stage: &mut Stage,
        ) -> Result<WorkSchedule<ChainEvent>, WorkerError> {
            let msg = stage.input.recv().await.or_panic()?;

            Ok(WorkSchedule::Unit(msg.payload))
        }

        async fn execute(
            &mut self,
            unit: &ChainEvent,
            stage: &mut Stage,
        ) -> Result<(), WorkerError> {
            // let blocks = sqlx::query!("select * from block")
            //     .fetch_all(&pool)
            //     .await
            //     .into_diagnostic()?;
            //
            tracing::info!("{:#?}", unit);

            stage.ops_count.inc(1);

            Ok(())
        }
    }

    #[derive(Stage)]
    #[stage(name = "sink-tidb", unit = "ChainEvent", worker = "Worker")]
    pub struct Stage {
        database_url: String,

        pub input: SinkInputPort,
        pub cursor: SinkCursorPort,

        #[metric]
        ops_count: gasket::metrics::Counter,

        #[metric]
        latest_block: gasket::metrics::Gauge,
    }

    impl Stage {
        pub fn new(database_url: String) -> Self {
            Self {
                database_url,
                input: Default::default(),
                cursor: Default::default(),
                ops_count: Default::default(),
                latest_block: Default::default(),
            }
        }
    }
}

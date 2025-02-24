use argus::Cli;

use miette::IntoDiagnostic;
use tracing::subscriber::set_global_default;
use tracing_subscriber::FmtSubscriber;

#[tokio::main]
async fn main() -> miette::Result<()> {
    let subscriber = FmtSubscriber::builder()
        .with_max_level(tracing::Level::DEBUG)
        .finish();

    set_global_default(subscriber).into_diagnostic()?;

    let cli = Cli::default();

    cli.exec()
}

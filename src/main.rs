use argus::config::IndexerConfig;
use miette::IntoDiagnostic;
use sqlx::MySqlPool;

#[tokio::main]
async fn main() -> miette::Result<()> {
    let indexer_config = IndexerConfig::load().into_diagnostic()?;

    let pool = MySqlPool::connect(&indexer_config.database_url)
        .await
        .into_diagnostic()?;

    let blocks = sqlx::query!("select slot from blocks")
        .fetch_all(&pool)
        .await
        .into_diagnostic()?;

    Ok(())
}

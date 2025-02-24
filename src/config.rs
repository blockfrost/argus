use config::{Config, ConfigError, Environment};
use serde::Deserialize;

#[derive(Debug, Deserialize)]
pub struct IndexerConfig {
    pub dolos_endpoint: String,
    pub database_url: String,
}

impl IndexerConfig {
    pub fn load() -> Result<Self, ConfigError> {
        dotenvy::dotenv().ok();

        let ic = Config::builder()
            .add_source(Environment::default())
            .build()?;

        ic.try_deserialize()
    }
}

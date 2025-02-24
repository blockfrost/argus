use crate::cmd;

use clap::Parser;

#[derive(Parser)]
#[clap(version, about)]
#[clap(propagate_version = true)]
pub enum Cli {
    Start(cmd::start::Args),
}

impl Default for Cli {
    fn default() -> Self {
        Self::parse()
    }
}

impl Cli {
    pub fn exec(self) -> miette::Result<()> {
        match self {
            Cli::Start(args) => args.exec(),
        }
    }
}

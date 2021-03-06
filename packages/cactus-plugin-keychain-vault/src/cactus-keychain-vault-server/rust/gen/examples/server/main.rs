//! Main binary entry point for openapi_client implementation.

#![allow(missing_docs)]

use clap::{App, Arg};
use std::env;

mod server;


/// Create custom server, wire it to the autogenerated router,
/// and pass it to the web server.
#[tokio::main]
async fn main() {
    env_logger::init();

    let matches = App::new("server")
        .arg(Arg::with_name("https")
            .long("https")
            .help("Whether to use HTTPS or not"))
        // FIXME find a way to propagate these into the context of the hyper handlers and then use them
        // FIXME make sure environment variables can also be used to specify the same configuration arguments
        // (no idea if clap does that by default or not)
        // .arg(Arg::with_name("vault-host")
        //     .short("h")
        //     .long("vault-host")
        //     .takes_value(true)
        //     .default_value("http://localhost:8200")
        //     .help("The address/DNS name + port number where the targeted Vault instance can be reached."))
        // .arg(Arg::with_name("vault-token")
        //     .short("t")
        //     .long("vault-token")
        //     .takes_value(true)
        //     .help("The token to use when authenticating against the targeted Vault instance."))
        .get_matches();

    let temp_host;
    let host: &str;
    if env::var("HOST").is_err() {
        host = "127.0.0.1:8080"
    } else {
        temp_host = env::var("HOST").unwrap();
        host = &*temp_host;
    }

    let r = server::create(host, matches.is_present("https"), "", "").await;
    println!("{:?}", r)
}

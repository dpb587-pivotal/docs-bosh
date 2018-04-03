# CLI Global Flags

The following flags are available for all commands of the CLI. Although these options may be usable for all commands, some may not be relevant to a particular command.


## Help

 * `--help` / `-h` - shows helpful information about available commands and command-specific options


## Version

 * `--version` / `-v` - flag shows CLI version.

<p class="note">Note: To see Director version use `bosh env` command.</p>


## Environment

 * `--environment` / `-e` - specify Director VM address or environment alias (`BOSH_ENVIRONMENT` environment variable)
 * `--ca-cert` - specify CA certificate used for connecting for Director and UAA (`BOSH_CA_CERT` environment variable)

CLI does not provide a way to skip SSL certificate validation to encourage secure Director configuration.

See [CLI environments](cli-envs.md) for details.


## Authentication

 * `--client` - specify basic auth username or UAA client ID (`BOSH_CLIENT` environment variable)
 * `--client-secret` - specify basic auth password or UAA client secret (`BOSH_CLIENT_SECRET` environment variable)

CLI does not provide a way to specify UAA user login information since all non-interactive use (in scripts) should use UAA clients. The `log-in` command must be used for interactive logins.


## Output

 * `--non-interactive` / `-n` - affirms any confirmation that typically requires use input (`BOSH_NON_INTERACTIVE=true` environment variable)
 * `--json` - changes output format to JSON
 * `--tty` - forces output to include all decorative text typically visible when command is not redirected
 * `--no-color` - disables colors (enabled by default when command is redirected)
 * `--column` - for tabular output, only show specific columns (may be specified multiple times)

CLI makes a distinction between decorative text (table headings) and primary content (such as tables). To make it eas easy to parse command output via other tools (such as grep) when decorative text is automatically hidden when command output is redirected.


## Deployment

 * `--deployment` / `-d` - specify deployment for a command (`BOSH_DEPLOYMENT` environment variable)

Several commands that can operate in a Director and a deployment context (such as `bosh tasks` command) account for presence of this flag and filter their output based on a deployment.


## SOCKS5 Tunneling <a id="tunnel"></a>

See [tunneling](cli-tunnel.md) for details.


## Logging

Along with the UI output (stdout) and UI errors (stderr), CLI can output more verbose logs.

Logging is disabled by default (`BOSH_LOG_LEVEL` defaults to `none`).

To enable logging, set the `BOSH_LOG_LEVEL` environment variable to one of the following values: `debug`, `info`, `warn`, `error`, `none` (default)

Logs write to stdout (debug & info) & stderr (warn & error) by default.

To write logs to a file, set the `BOSH_LOG_PATH` environment variable to the path of the file to create and/or append to.

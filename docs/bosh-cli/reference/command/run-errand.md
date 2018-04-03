# `bosh  run-errand `

    Usage:
      bosh [OPTIONS] run-errand [run-errand-OPTIONS] NAME
    
    Run errand
    
    https://bosh.io/docs/cli-v2#run-errand
    
    Application Options:
      -v, --version                                      Show CLI version
          --config=                                      Config file path (default: ~/.bosh/config) [$BOSH_CONFIG]
      -e, --environment=                                 Director environment name or URL [$BOSH_ENVIRONMENT]
          --ca-cert=                                     Director CA certificate path or value [$BOSH_CA_CERT]
          --sha2                                         Use SHA256 checksums [$BOSH_SHA2]
          --parallel=                                    The max number of parallel operations (default: 5)
          --client=                                      Override username or UAA client [$BOSH_CLIENT]
          --client-secret=                               Override password or UAA client secret [$BOSH_CLIENT_SECRET]
      -d, --deployment=                                  Deployment name [$BOSH_DEPLOYMENT]
          --column=                                      Filter to show only given column(s)
          --json                                         Output as JSON
          --tty                                          Force TTY-like output
          --no-color                                     Toggle colorized output
      -n, --non-interactive                              Don't ask for user input [$BOSH_NON_INTERACTIVE]
    
    Help Options:
      -h, --help                                         Show this help message
    
    [run-errand command options]
              --instance=INSTANCE-GROUP[/INSTANCE-ID]    Instance or group the errand should run on (must specify errand by
                                                         release job name)
              --keep-alive                               Use existing VM to run an errand and keep it after completion
              --when-changed                             Run errand only if errand configuration has changed or if the
                                                         previous run was unsuccessful
              --download-logs                            Download logs
              --logs-dir=                                Destination directory for logs (default: .)

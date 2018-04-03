# `bosh  recreate `

    Usage:
      bosh [OPTIONS] recreate [recreate-OPTIONS] [INSTANCE-GROUP[/INSTANCE-ID]]
    
    Recreate instance(s)
    
    https://bosh.io/docs/cli-v2#recreate
    
    Application Options:
      -v, --version                           Show CLI version
          --config=                           Config file path (default: ~/.bosh/config) [$BOSH_CONFIG]
      -e, --environment=                      Director environment name or URL [$BOSH_ENVIRONMENT]
          --ca-cert=                          Director CA certificate path or value [$BOSH_CA_CERT]
          --sha2                              Use SHA256 checksums [$BOSH_SHA2]
          --parallel=                         The max number of parallel operations (default: 5)
          --client=                           Override username or UAA client [$BOSH_CLIENT]
          --client-secret=                    Override password or UAA client secret [$BOSH_CLIENT_SECRET]
      -d, --deployment=                       Deployment name [$BOSH_DEPLOYMENT]
          --column=                           Filter to show only given column(s)
          --json                              Output as JSON
          --tty                               Force TTY-like output
          --no-color                          Toggle colorized output
      -n, --non-interactive                   Don't ask for user input [$BOSH_NON_INTERACTIVE]
    
    Help Options:
      -h, --help                              Show this help message
    
    [recreate command options]
              --skip-drain                    Skip running drain scripts
              --force                         No-op for backwards compatibility
              --fix                           Fix unresponsive VMs
              --canaries=                     Override manifest values for canaries
              --max-in-flight=                Override manifest values for max_in_flight
              --dry-run                       Renders job templates without altering deployment

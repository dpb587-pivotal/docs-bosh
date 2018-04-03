# `bosh  logs `

    Usage:
      bosh [OPTIONS] logs [logs-OPTIONS] [INSTANCE-GROUP[/INSTANCE-ID]]
    
    Fetch logs from instance(s)
    
    https://bosh.io/docs/cli-v2#logs
    
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
    
    [logs command options]
              --dir=                          Destination directory (default: .)
          -f, --follow                        Follow logs via SSH
              --num=                          Last number of lines
          -q, --quiet                         Suppresses printing of headers when multiple files are being examined
              --job=                          Limit to only specific jobs
              --only=                         Filter logs (comma-separated)
              --agent                         Include only agent logs
              --gw-disable                    Disable usage of gateway connection [$BOSH_GW_DISABLE]
              --gw-user=                      Username for gateway connection [$BOSH_GW_USER]
              --gw-host=                      Host for gateway connection [$BOSH_GW_HOST]
              --gw-private-key=               Private key path for gateway connection [$BOSH_GW_PRIVATE_KEY]
              --gw-socks5=                    SOCKS5 URL [$BOSH_ALL_PROXY]

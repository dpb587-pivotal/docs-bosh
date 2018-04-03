# `bosh  update-config `

    Usage:
      bosh [OPTIONS] update-config [update-config-OPTIONS] PATH
    
    Update config
    
    https://bosh.io/docs/cli-v2#update-config
    
    Application Options:
      -v, --version                  Show CLI version
          --config=                  Config file path (default: ~/.bosh/config) [$BOSH_CONFIG]
      -e, --environment=             Director environment name or URL [$BOSH_ENVIRONMENT]
          --ca-cert=                 Director CA certificate path or value [$BOSH_CA_CERT]
          --sha2                     Use SHA256 checksums [$BOSH_SHA2]
          --parallel=                The max number of parallel operations (default: 5)
          --client=                  Override username or UAA client [$BOSH_CLIENT]
          --client-secret=           Override password or UAA client secret [$BOSH_CLIENT_SECRET]
      -d, --deployment=              Deployment name [$BOSH_DEPLOYMENT]
          --column=                  Filter to show only given column(s)
          --json                     Output as JSON
          --tty                      Force TTY-like output
          --no-color                 Toggle colorized output
      -n, --non-interactive          Don't ask for user input [$BOSH_NON_INTERACTIVE]
    
    Help Options:
      -h, --help                     Show this help message
    
    [update-config command options]
              --type=                Config type, e.g. 'cloud', 'runtime', or 'cpi'
              --name=                Config name
          -v, --var=VAR=VALUE        Set variable
              --var-file=VAR=PATH    Set variable to file contents
          -l, --vars-file=PATH       Load variables from a YAML file
              --vars-env=PREFIX      Load variables from environment variables (e.g.: 'MY' to load MY_var=value)
              --vars-store=PATH      Load/save variables from/to a YAML file
          -o, --ops-file=PATH        Load manifest operations from a YAML file
    
    [update-config command arguments]
      PATH:                          Path to a YAML config file

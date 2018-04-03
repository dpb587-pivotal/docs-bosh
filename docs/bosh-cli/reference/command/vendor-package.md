# `bosh  vendor-package `

    Usage:
      bosh [OPTIONS] vendor-package [vendor-package-OPTIONS] PACKAGE SRC-DIR
    
    Vendor package
    
    https://bosh.io/docs/cli-v2#vendor-package
    
    Application Options:
      -v, --version          Show CLI version
          --config=          Config file path (default: ~/.bosh/config) [$BOSH_CONFIG]
      -e, --environment=     Director environment name or URL [$BOSH_ENVIRONMENT]
          --ca-cert=         Director CA certificate path or value [$BOSH_CA_CERT]
          --sha2             Use SHA256 checksums [$BOSH_SHA2]
          --parallel=        The max number of parallel operations (default: 5)
          --client=          Override username or UAA client [$BOSH_CLIENT]
          --client-secret=   Override password or UAA client secret [$BOSH_CLIENT_SECRET]
      -d, --deployment=      Deployment name [$BOSH_DEPLOYMENT]
          --column=          Filter to show only given column(s)
          --json             Output as JSON
          --tty              Force TTY-like output
          --no-color         Toggle colorized output
      -n, --non-interactive  Don't ask for user input [$BOSH_NON_INTERACTIVE]
    
    Help Options:
      -h, --help             Show this help message
    
    [vendor-package command options]
              --dir=         Release directory path if not current working directory (default: .)

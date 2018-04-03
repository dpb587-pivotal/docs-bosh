# `bosh  finalize-release `

    Usage:
      bosh [OPTIONS] finalize-release [finalize-release-OPTIONS] PATH
    
    Create final release from dev release tarball
    
    https://bosh.io/docs/cli-v2#finalize-release
    
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
    
    [finalize-release command options]
              --dir=         Release directory path if not current working directory (default: .)
              --name=        Custom release name
              --version=     Custom release version (e.g.: 1.0.0, 1.0-beta.2+dev.10)
              --force        Ignore Git dirty state check

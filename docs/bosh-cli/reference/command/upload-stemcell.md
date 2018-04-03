# `bosh  upload-stemcell `

    Usage:
      bosh [OPTIONS] upload-stemcell [upload-stemcell-OPTIONS] URL
    
    Upload stemcell
    
    https://bosh.io/docs/cli-v2#upload-stemcell
    
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
    
    [upload-stemcell command options]
              --fix          Replaces the stemcell if already exists
              --name=        Name used in existence check (is not used with local stemcell file)
              --version=     Version used in existence check (is not used with local stemcell file)
              --sha1=        SHA1 of the remote stemcell (is not used with local files)
    
    [upload-stemcell command arguments]
      URL:                   Path to a local file or URL

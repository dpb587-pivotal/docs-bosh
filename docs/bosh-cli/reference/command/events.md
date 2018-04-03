# `bosh  events `

    Usage:
      bosh [OPTIONS] events [events-OPTIONS]
    
    List events
    
    https://bosh.io/docs/cli-v2#events
    
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
    
    [events command options]
              --before-id=   Show events with ID less than the given ID
              --before=      Show events before the given timestamp (ex: 2016-05-08 17:26:32)
              --after=       Show events after the given timestamp (ex: 2016-05-08 17:26:32)
              --task=        Show events with the given task ID
              --instance=    Show events with given instance
              --event-user=  Show events with given user
              --action=      Show events with given action
              --object-type= Show events with given object type
              --object-name= Show events with given object name

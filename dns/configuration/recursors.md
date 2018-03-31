Here is how DNS release chooses recurors before starting its operation:

1. by default will pick up recursors specified in `/etc/resolv.conf` (denoted by `nameserver` keyword)
  - alternatively, if `recursors` property is set use specified recursors
1. exclude recursors specified in `excluded_recursors` property
1. randomly pick one recursor from the list of recursors
  - note that all recursors in this list will be considered equivalent, ie able to resolve same domains
1. failover to using another randomly picked recursor, if current recursor exhibits connectivity problems
  - connectivity problems do not account for resolution problems (NXDOMAIN, or other DNS level errors)

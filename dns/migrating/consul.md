# Migrating from Consul

To ease migration from Consul DNS entries, DNS release provides [aliases feature](../extensions/aliases.md). It allows operators to define custom DNS entries that can map to BOSH generated DNS entries. To migrate off of Consul to native DNS:

1. Enable DNS (see [Installation](../installation.md) instructions) with proper recursors configured
1. Continue deploying `consul_agent` job
1. Define native DNS aliases that match existing Consul DNS entries
1. Redeploy all deployments that use Consul
1. Redeploy all deployments without `consul_agent` job

TODO expand steps; document issues of consul

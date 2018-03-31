# Migrating from PowerDNS

Historically BOSH users did not have an easy highly available solution to enable DNS for their deployments. PowerDNS was a possible choice; however, it required more advanced configuration that we felt comfortable recommending to everyone. We are planning to deprecate and remove PowerDNS integration. To migrate from PowerDNS to native DNS:

1. Continue deploying Director with `powerdns` job
1. Enable native DNS (see [Installation](../installation.md) instructions) with proper recursors configured
1. Redeploy all deployments and make sure that native DNS is in use
1. Redeploy Director without `powerdns` job

TODO expand steps; document more about issues of powerdns

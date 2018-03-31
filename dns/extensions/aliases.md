DNS release allows operators to specify custom names for BOSH generated DNS records to ease migration or work with legacy software that requires very specific DNS record formats (e.g. `master0`, `slave0`, `slave1`).

!!! note
    If you are using aliases to migrate away from Consul, you may want to read the [Consul migration guide](../migrating/consul.md).


## Configuring Aliases

- via [`aliases` property](https://bosh.io/jobs/bosh-dns?source=github.com/cloudfoundry/bosh-dns-release#p=aliases)

Example usage of `aliases` property:

```yaml
properties:
  aliases:
    bbs.service.cf.internal:
    - "*.database-z1.diego1.cf-cfapps-io2-diego.bosh"
    - "*.database-z2.diego2.cf-cfapps-io2-diego.bosh"
```

Above will resolve `bbs.service.cf.internal` to a all IPs (shuffled) matching following instance patterns: `*.database-z1.diego1.cf-cfapps-io2-diego.bosh` or `*.database-z2.diego2.cf-cfapps-io2-diego.bosh`.


### BOSH DNS Release

- via `dns/aliases.json` template inside your job


## Examples

 * release w/ aliases.json


TODO expand

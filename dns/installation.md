## DNS release

To take advantage of native DNS functionality, it's expected that [DNS release](https://bosh.io/releases/github.com/cloudfoundry/bosh-dns-release?all=1) runs on each VM. We recommend to colocate DNS release by definiting it in an [addon](../runtime-config.md#addons).

DNS release provides two jobs: `bosh-dns` (for Linux) and `bosh-dns-windows` (for Windows) which start a simple DNS server bound to a [link local address](https://bosh.io/jobs/bosh-dns?source=github.com/cloudfoundry/bosh-dns-release#p=address).

### Healthiness

DNS release provides a way to reference all instances (or a subset of instances) in a link via single DNS record. By default only heatlhy instances are returned from a group query when there is at least one healthy insance. When there are no healthy instances, all instances will be returned. The notion of instance healthiness is directly tied to the state of processes running on a VM. DNS release will continiously poll for updated healthiness information (same information is visible via `bosh instances --ps` command) on all instances from groups that were resolved at least once.

To enable healthiness, use `health.enabled` property and specify necessary TLS certificates. Canonical DNS runtime config with healthiness enabled can be found here: https://github.com/cloudfoundry/bosh-deployment/blob/master/runtime-configs/dns.yml.

### Caching

DNS release provides a way to enable response caching based on response TTLs. Enabling caching typically will alleviate some pressure from your upstream DNS servers and decrease  latency of DNS resolutions.

To enable caching, use `cache.enabled` property. Canonical DNS runtime config with caching enabled can be found here: https://github.com/cloudfoundry/bosh-deployment/blob/master/runtime-configs/dns.yml.

### Additional Handlers

DNS release provides a way to delegate certain domains via [`handlers` property](https://bosh.io/jobs/bosh-dns?source=github.com/cloudfoundry/bosh-dns-release#p=handlers) to different DNS or HTTP servers. This functionality can be used as an alternative to configuring upstream DNS servers with custom zone configurations.

---
## Enabling DNS

To enable native BOSH functionality, you must first enable [`local_dns.enabled` property](https://bosh.io/jobs/director?source=github.com/cloudfoundry/bosh#p=director.local_dns.enabled) in the Director job. See [bosh-deployment's local-dns.yml](https://github.com/cloudfoundry/bosh-deployment/blob/master/local-dns.yml) as an example.

Enabling `local_dns.enabled` configuration will make Director broadcast DNS updates to all VMs. Only VMs based on 3421+ Linux stemcells will accept DNS broadcast message.

If you were relying on instance index based DNS records, you must enable [`local_dns.include_index` property](https://bosh.io/jobs/director?source=github.com/cloudfoundry/bosh#p=director.local_dns.enabled) in the Director job.

Additionally you should colocate DNS release via an addon in all your deployments. See [bosh-deployment's runtime-configs/dns.yml](https://github.com/cloudfoundry/bosh-deployment/blob/master/runtime-configs/dns.yml) as an example.


### Impact on links <a id='links'></a>

Each link includes some networking information about its provider. Addresses returned by a link may be either IP addresses or DNS addresses.

As of bosh-release v263 opting into DNS addresses in links must be done explicitly. Previous Director versions would opt into this behaviour by default.

You can control type of addresses returned at three different levels:

- for the entire Director via Director job configuration [`director.local_dns.use_dns_addresses` property](https://bosh.io/jobs/director?source=github.com/cloudfoundry/bosh#p=director.local_dns.use_dns_addresses) that if enabled affects all deployments by default. We are planning to eventually change this configuration to true by default.

- for a specific deployment via [`features.use_dns_addresses` deployment manifest property](../manifest-v2.md#features) that if enabled affects links within this deployment

- for a specific link via its `ip_addresses` configuration

    If for some reason (discouraged) particular job cannot work with links that return DNS addresses, you can ask the Director to return IP addresses on best effort basis. Here is an example how to opt into this behaviour for a single link:

    ```yaml
    instance_groups:
    - name: zookeeper
      jobs:
      - name: zookeeper
        release: zookeeper
        consumes:
          peers: {ip_addresses: true}
    ...
    ```

Once native DNS addresses in links are enabled DNS addresses will be returned instead of IPs. Note that links provided by instance groups placed on dynamic networks will always provide DNS addresses.

```ruby
# before
link("db").address => "q-s0.db.default.db.bosh"
link("db").instances[0].address => "172.10.10.0"

# after
link("db").address => "q-s0.db.default.db.bosh"
link("db").instances[0].address => "ef489dd9-48f6-45f0-b7af-7f3437919b17.db.default.db.bosh"
```

### Impact on job's address (`spec.address`) <a id='job-address'></a>

Similar to how [links are affected](#links), `spec.address` will start returning DNS address once `use_dns_addresses` feature is enabled.

### Types of DNS addresses <a id='dns-addresses'></a>

There are two types of DNS addresses that native DNS supports:

- instance specific queries that resolve to a single instance
  - provided by `spec.address` or `link("...").instances[...].address` ERB accessors
- group specific queries that resolve to multiple instances
  - provided by `link("...").address` ERB accessor

Since BOSH DNS is automatically managed, DNS addresses are not meant to be constructed manually by operators or scripts. To obtain a DNS address you can use upcoming Links API or job template accessors within your jobs.

---
title: Runtime Config
---

The Director has a way to specify global configuration for all VMs in all deployments. The runtime config is a YAML file that defines IaaS agnostic configuration that applies to all deployments.

!!! info
    Support for runtime configs was first introduced in [bosh/v255.4](https://github.com/cloudfoundry/bosh/releases/tag/stable-3213).


## Updating and retrieving runtime config <a id='update'></a>

To update runtime config on the Director use [`bosh update runtime-config`](sysadmin-commands.md#cloud-config) CLI command.

```shell
$ bosh update-runtime-config runtime.yml

$ bosh runtime-config
Acting as user 'admin' on 'micro'

releases:
- name: strongswan
  version: 6.0.0

addons:
- name: security
  jobs:
  - name: strongswan
    release: strongswan
    properties:
      strongswan:
        ca_cert: ...
  - name: syslog_drain
    release: syslog
    properties:
      syslog_drain_ips: [10.10.0.20]
  include:
    deployments: [dep1, dep2]...
```

Once runtime config is updated all deployments will be considered outdated. `bosh deployments` does not currently show that but we have plans to show that information. The Director will apply runtime config changes to each deployment during the next `bosh deploy` for that deployment.


## Examples

### Resource Tagging

For example, if you were interested in your resources being tagged with `business_unit` and `email_contact`, you can use the [`tags`](runtime-config-schema.md#tags) section:

```yaml
tags:
  business_unit: marketing
  email_contact: ops@marketing.co.com
```


### Removing Addons

To remove all addons in a configuration, specify empty arrays:

```yaml
releases: []
addons: []
```


## See Also

 * [Runtime Config Schema](runtime-config-schema.md)
 * [More Examples](runtime-config-examples.md)

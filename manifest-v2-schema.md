---
schema: true
---

The deployment manifest is a YAML file that defines the components and properties of the deployment. When an operator initiates a new deployment using the CLI, the Director receives a manifest and creates or updates a deployment with matching name. To use this type of deployment manifest, you must be also be using [cloud config](cloud-config.md).

!!! info
    Support for this style of deployment manifest was first introduced in [bosh/v255.4](https://github.com/cloudfoundry/bosh/releases/tag/stable-3213).


## `name` {: #name }

The name of the deployment. A single Director can manage multiple deployments and distinguishes them by name.

 * *Required*
 * *Type*: String


## `features` {: #features }

Specifies Director features that should be used within this deployment.

 * *Optional*
 * *Type*: Object


> ### `use_dns_addresses` {: #features-use_dns_addresses }
>
> Enables or disables returning of DNS addresses in links. Defaults to global Director `use_dns_addresses` configuration.
>
>  * *Optional*
>  * *Type*: Boolean
>
>
> ### `randomize_az_placement` {: #features-randomize_az_placement }
>
> Randomizes AZs for left over instances that cannot be distributed equally between AZs. For example, given an instance group with 5 instances and only 3 AZs, 1 remaining instance will be placed in randomly chosen AZ out of specified 3 AZs. Available in bosh-release v264+.
>
>  * *Optional*
>  * *Type*: Boolean


## `releases[]` {: #releases }

The name and version of each release in the deployment.

 * *Required*
 * *Type*: Array


> ### `name` {: #releases-name }
>
> Name of a release used in the deployment.
>
>  * *Required*
>  * *Type*: String
>
>
> ### `version` {: #releases-version }
>
> The version of the release to use. Version can be `latest`.
>
>  * *Required*
>  * *Type*: String
>
>
> ### `url` {: #releases-url }
>
> URL of a release to download. Works with CLI v2.
>
>  * *Optional*
>  * *Type*: String
>
>
> ### `sha1` {: #releases-sha1 }
>
> SHA1 of asset referenced via URL. Works with CLI v2. Example: `332ac15609b220a3fdf5efad0e0aa069d8235788`. See [Release URLs](release-urls.md) for more details.
>
>  * *Optional*
>  * *Type*: String
>

## `stemcells[]` {: #stemcells }

The name and version of each stemcell in the deployment.

 * *Required*
 * *Type*: Array


> ### `alias` {: #stemcells-alias}
>
> Name of a stemcell used in the deployment
>
>  * *Required*
>  * *Type*: String
>
>
> ### `os` {: #stemcells-os}
>
> Operating system of a matching stemcell. Example: `ubuntu-trusty`.
>
>  * *Optional*
>  * *Type*: String
>
>
> ### `version` {: #stemcells-version}
>
> The version of a matching stemcell. Version can be `latest`.
>
>  * *Required*
>  * *Type*: String
>
>
> ### `name` {: #stemcells-name}
>
> Full name of a matching stemcell. Either `name` or `os` keys can be specified.
>
>  * *Optional*
>  * *Type*: String
>

## `update` {: #update }

This specifies instance update properties. These properties control how BOSH updates instances during the deployment. See [job lifecycle](job-lifecycle.md) for more details on startup/shutdown procedure within each VM.

 * *Required*
 * *Type*: Object


> ### `canaries` {: #update-canaries }
>
> The number of [canary](./terminology.html#canary) instances.
>
>  * *Required*
>  * *Type*: Integer
>
>
> ### `max_in_flight` {: #update-max_in_flight }
>
> The maximum number of non-canary instances to update in parallel within an availability zone.
>
>  * *Required*
>  * *Type*: Integer or Percentage
>
>
> ### `canary_watch_time` {: #update-canary_watch_time }
>
> Only applies to monit start operation.
>
>  * If the `canary_watch_time` is an integer, the Director sleeps for that many milliseconds, then checks whether the canary instances are healthy.
>  * If the `canary_watch_time` is a range (low-high), the Director:
>     * Waits for `low` milliseconds
>     * Waits until instances are healthy or `high` milliseconds have passed since instances started updating
>
>  * *Required*
>  * *Type*: Integer or Range
>
>
> ### `update_watch_time` {: #update-update_watch_time }
>
> Only applies to monit start operation.
>
>  * If the `update_watch_time` is an integer, the Director sleeps for that many milliseconds, then checks whether the instances are healthy.
>  * If the `update_watch_time` is a range (low-high), the Director:
>     * Waits for `low` milliseconds
>     * Waits until instances are healthy or `high` milliseconds have passed since instances started updating
>
>  * *Required*
>  * *Type*: Integer or Range
>
>
> ### `serial` {: #update-serial }
>
> If disabled (set to `false`), instance groups will be deployed in parallel, otherwise - sequentially. Instances within a group will still follow `canary` and `max_in_flight` configuration. Defaults to `true`.
>
>  * *Optional*
>  * *Type*: Boolean
>

## `instance_groups[]` {: #instance_groups }

Specifies the mapping between release [jobs](./terminology.html#job) and instance groups.

 * *Required*
 * *Type*: Array of Objects

> ### `name` {: #instance_groups-name}
>
> A unique name used to identify and reference instance group.
>
>  * *Required*
>  * *Type*: String
>
>
> ### `azs[]` {: #instance_groups-azs}
>
> List of AZs associated with this instance group (should only be used when using [first class AZs](azs.md)). Example: `[z1, z2]`.
>
>  * *Required*
>  * *Type*: Array of Strings
>
>
> ### `instances` {: #instance_groups-instances}
>
> The number of instances in this group. Each instance is a VM.
>
>  * *Required*
>  * *Type*: Integer
>
>
> ### `jobs[]` {: #instance_groups-jobs}
>
> Specifies the name and release of jobs that will be installed on each instance.
>
>  * *Required*
>  * *Type*: Array of Objects
>
>
> > #### `name` {: #instance_groups-jobs-name }
> >
> > The job name
> >
> >  * *Required*
> >  * *Type*: String
> >
> >
> > #### `release` {: #instance_groups-jobs-release }
> >
> > The release where the job exists
> >
> >  * *Required*
> >  * *Type*: String
> >
> >
> > #### `consumes` {: #instance_groups-jobs-consumes }
> >
> > Links consumed by the job. [Read more about link configuration](links.md#deployment)
> >
> >  * *Optional*
> >  * *Type*: Object
> >
> >
> > #### `provides` {: #instance_groups-jobs-provides }
> >
> > Links provided by the job. [Read more about link configuration](links.md#deployment)
> >
> >  * *Optional*
> >  * *Type*: Object
> >
> >
> > #### `properties` {: #instance_groups-jobs-properties }
> >
> > Specifies job properties. Properties allow BOSH to configure jobs to a specific environment. `properties` defined in a Job block are accessible only to that job. Only properties specified here will be provided to the job.
> >
> >  * *Optional*
> >  * *Type*: Object
>
>
> ### `vm_type` {: #instance_groups-vm_type}
>
> A valid VM type name from the cloud config. Alternatively you can specify `vm_resources` key.
>
>  * *Required*
>  * *Type*: String
>
>
> ### `vm_extensions[]` {: #instance_groups-vm_extensions}
>
> A valid list of VM extension names from the cloud config.
>
>  * *Optional*
>  * *Type*: String
>
>
> ### `vm_resources` {: #instance_groups-vm_resources}
>
> Specifies generic VM resources such as CPU, RAM and disk size that are automatically translated into correct VM cloud properties to determine VM size. VM size is determined on best effort basis as some IaaSes may not support exact size configuration.
> Currently some CPIs (Google) do not support this functionality. Available in bosh-release v264+.
>
>  * *Optional*
>  * *Type*: Object
>
>
> > #### `cpu` {: #instance_groups-vm_resources-cpu }
> >
> > Number of CPUs.
> >
> >  * *Required*
> >  * *Type*: Integer
> >
> >
> > #### `ram` {: #instance_groups-vm_resources-ram }
> >
> > Amount of RAM in MB.
> >
> >  * *Required*
> >  * *Type*: Integer
> >
> >
> > #### `ephemeral_disk_size` {: #instance_groups-vm_resources-ephemeral_disk_size }
> >
> > Ephemeral disk size in MB.
> >
> >  * *Required*
> >  * *Type*: Integer
>
>
> ### `stemcell` {: #instance_groups-stemcell}
>
> A valid stemcell alias from the Stemcells Block.
>
>  * *Required*
>  * *Type*: String
>
>
> ### `persistent_disk` {: #instance_groups-persistent_disk}
>
> Persistent disk size in MB. Alternatively you can specify `persistent_disk_type` key. [Read more about persistent disks](./persistent-disks.html)
>
>  * *Optional*
>  * *Type*: Integer
>
>
> ### `persistent_disk_type` {: #instance_groups-persistent_disk_type}
>
> A valid disk type name from the cloud config. [Read more about persistent disks](./persistent-disks.html)
>
>  * *Optional*
>  * *Type*: String
>
>
> ### `networks[]` {: #instance_groups-networks}
>
> Specifies the networks this instance requires. Each network can have the following properties specified:
>
>  * *Required*
>  * *Type*: Array of Objects
>
>
> > #### `name` {: #instance_groups-networks-name }
> >
> > A valid network name from the cloud config.
> >
> >  * *Required*
> >  * *Type*: String
> >
> >
> > #### `static_ips` {: #instance_groups-networks-static_ips }
> >
> > Array of IP addresses reserved for the instances on the network.
> >
> >  * *Optional*
> >  * *Type*: Array
> >
> >
> > #### `default[]` {: #instance_groups-networks-default }
> >
> > Specifies which network components (DNS, Gateway) BOSH populates by default from this network. This property is required if more than one network is specified.
> >
> >  * *Optional*
> >  * *Type*: String
>
>
> ### `update` {: #instance_groups-update}
>
> Specific update settings for this instance group. Use this to override [global job update settings](#update) on a per-instance-group basis.
>
>  * *Optional*
>  * *Type*: Object
>
>
> ### `migrated_from[]` {: #instance_groups-migrated_from}
>
> Specific migration settings for this instance group. Use this to [rename and/or migrate instance groups](migrated-from.md).
>
>  * *Optional*
>  * *Type*: Array
>
>
> ### `lifecycle` {: #instance_groups-lifecycle}
>
> Specifies the kind of workload the instance group represents. Valid values are `service` and `errand`; defaults to `service`. A `service` runs indefinitely and restarts if it fails. An `errand` starts with a manual trigger and does not restart if it fails.
>
>  * *Optional*
>  * *Type*: String
>
>
> ### `properties` {: #instance_groups-properties}
>
> Specifies instance group properties. Deprecated in favor of job level properties and links.
>
>  * *Optional*
>  * *Type*: Object
>
>
> ### `env` {: #instance_groups-env}
>
> Specifies advanced BOSH Agent configuration for each instance in the group.
>
>  * *Optional*
>  * *Type*: Object
>
>
> > #### `bosh` {: #instance_groups-env-bosh }
> >
> >  * *Optional*
> >  * *Type*: Object
> >
> >
> > > ##### `password` {: #instance_groups-env-bosh-password }
> > >
> > > Crypted password for `vcap/root` user (will be placed into /etc/shadow on Linux).    
> > >
> > >  * *Optional*
> > >  * *Type*: String
> > >
> > >
> > > ##### `keep_root_password` {: #instance_groups-env-bosh-keep_root_password }
> > >
> > > Keep password for `root` and only change password for `vcap`. Default: `false`.
> > >
> > >  * *Optional*
> > >  * *Type*: Boolean
> > >
> > >
> > > ##### `remove_dev_tools` {: #instance_groups-env-bosh-remove_dev_tools }
> > >
> > > Remove [compilers and dev tools](https://github.com/cloudfoundry/bosh-linux-stemcell-builder/blob/master/stemcell_builder/stages/dev_tools_config/assets/generate_dev_tools_file_list_ubuntu.sh) on non-compilation VMs. Default: `false`.
> > >
> > >  * *Optional*
> > >  * *Type*: Boolean
> > >
> > >
> > > ##### `remove_static_libraries` {: #instance_groups-env-bosh-remove_static_libraries }
> > >
> > > Remove [static libraries](https://github.com/cloudfoundry/bosh-linux-stemcell-builder/blob/master/stemcell_builder/stages/static_libraries_config/assets/static_libraries_list.txt) on non-compilation VMs. Default: `false`.
> > >
> > >  * *Optional*
> > >  * *Type*: Boolean
> > >
> > >
> > > ##### `swap_size` {: #instance_groups-env-bosh-swap_size }
> > >
> > > Size of swap partition in MB to create. Set this to 0 to avoid having a swap partition created. Default: RAM size of used VM type up to half of the ephemeral disk size.
> > >
> > >  * *Optional*
> > >  * *Type*: Integer
> > >
> > >
> > > ##### `ipv6` {: #instance_groups-env-bosh-ipv6 }
> > >
> > >  * *Optional*
> > >  * *Type*: Object
> > >
> > >
> > > > ###### `enable` {: #instance_groups-env-bosh-ipv6-enable }
> > > >
> > > > Force IPv6 enabled in kernel (this configuration is not necessary if one of the VM addresses is IPv6). Default: `false`.
> > > >
> > > >  * *Optional*
> > > >  * *Type*: Boolean


## `addons[]` {: #addons }

<p class="note">Note: This feature is available with bosh-release v262+.</p>

Specifies the [addons](./terminology.html#addon) to be applied to this deployments.

See [Addons Block](runtime-config-schema.md#addons) for the schema.

Unlike addons specified in a runtime config, addons specified in the deployment manifest do not respect inclusion and exclusion rules for `deployments`.


## `properties` {: #properties }

Describes global properties. Deprecated in favor of job level properties and links.

 * *Optional*
 * *Type*: Object


## `variables[]` {: #variables }

Describes variables. See [CLI Variable Interpolation](cli-int.md) for more details about variables.

 * *Optional*
 * *Type*: Array of Objects


> ### `name` {: #name }
>
> Unique name used to identify a variable. Example: `admin_password`
>
>  * *Required*
>  * *Type*: String
>
>
> ### `type` {: #type }
>
> Type of a variable. Currently supported variable types are `certificate`, `password`, `rsa`, and `ssh`. Example: `password`.
>
>  * *Required*
>  * *Type*: String
>
>
> ### `options` {: #options }
>
> Specifies generation options used for generating variable value if variable is not found. Example: `{is_ca: true, common_name: some-ca}`
>
>  * *Optional*
>  * *Type*: Object


## `tags` {: #tags }

Specifies key value pairs to be sent to the CPI for VM tagging. Combined with runtime config level tags during the deploy. Available in bosh-release v258+.

 * *Optional*
 * *Type*: Object

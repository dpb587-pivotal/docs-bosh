The cloud config defines IaaS-specific configuration used by the Director and all deployments. It is intended to keep IaaS-specific configuration separate to keep deployment manifests as IaaS-agnostic as possible to ensure deployments can be reused across environments.



---
## Networks Block <a id='networks'></a>

**networks** [Array, required]: Each sub-block listed in the Networks block specifies a network configuration that jobs can reference. There are three different network types: `manual`, `dynamic`, and `vip`. At least one should be specified.

See [networks](networks.md) for more details.

### CPI Specific `cloud_properties` <a id='networks-cloud-properties'></a>

- [See AWS CPI network cloud properties](../../../existing-docs/aws-cpi.md#networks)
- [See Azure CPI network cloud properties](../../../existing-docs/azure-cpi.md#networks)
- [See OpenStack CPI network cloud properties](../../../existing-docs/openstack-cpi.md#networks)
- [See SoftLayer CPI network cloud properties](../../../existing-docs/softlayer-cpi.md#networks)
- [See Google Cloud Plaform CPI network cloud properties](../../../existing-docs/google-cpi.md#networks)
- [See vSphere CPI network cloud properties](../../../existing-docs/vsphere-cpi.md#networks)
- [See vCloud CPI network cloud properties](../../../existing-docs/vcloud-cpi.md#networks)

---
## VM Types Block <a id='vm-types'></a>

**vm_types** [Array, required]: Specifies the [VM types](./terminology.html#vm-type) available to deployments. At least one should be specified.

* **name** [String, required]: A unique name used to identify and reference the VM type
* **cloud_properties** [Hash, optional]: Describes any IaaS-specific properties needed to create VMs; for most IaaSes, some data here is actually required. See [CPI Specific `cloud_properties`](#vm-types-cloud-properties) below. Example: `instance_type: m3.medium`. Default is `{}` (empty Hash).

Example:

```yaml
vm_types:
- name: default
  cloud_properties:
    instance_type: m1.small
```

### CPI Specific `cloud_properties` <a id='vm-types-cloud-properties'></a>

- [See AWS CPI VM types cloud properties](../../../existing-docs/aws-cpi.md#resource-pools)
- [See Azure CPI VM types cloud properties](../../../existing-docs/azure-cpi.md#resource-pools)
- [See OpenStack CPI VM types cloud properties](../../../existing-docs/openstack-cpi.md#resource-pools)
- [See SoftLayer CPI VM types cloud properties](../../../existing-docs/softlayer-cpi.md#resource-pools)
- [See Google Cloud Platform CPI VM types cloud properties](../../../existing-docs/google-cpi.md#resource-pools)
- [See vSphere CPI VM types cloud properties](../../../existing-docs/vsphere-cpi.md#resource-pools)
- [See vCloud CPI VM types cloud properties](../../../existing-docs/vcloud-cpi.md#resource-pools)

---
## VM Extensions Block <a id='vm-extensions'></a>

<p class="note">Note: This feature is available with bosh-release v255.4+.</p>

**vm_extensions** [Array, optional]: Specifies the [VM extensions](./terminology.html#vm-extension) available to deployments.

* **name** [String, required]: A unique name used to identify and reference the VM extension
* **cloud_properties** [Hash, optional]: Describes any IaaS-specific properties needed to configure VMs. Example: `elbs: [...]`. Default is `{}` (empty Hash).

Example:

```yaml
vm_extensions:
- name: pub-lbs
  cloud_properties:
    elbs: [main]
```

Any IaaS specific configuration could be placed into a VM extension's `cloud_properties`.

---
## Disk Types Block <a id='disk-types'></a>

**disk_types** [Array, required]: Specifies the [disk types](./terminology.html#disk-types) available to deployments. At least one should be specified.

* **name** [String, required]: A unique name used to identify and reference the disk type
* **disk_size** [Integer, required]: Specifies the disk size. `disk_size` must be a positive integer. BOSH creates a [persistent disk](./persistent-disks.html) of that size in megabytes and attaches it to each job instance VM.
* **cloud_properties** [Hash, optional]: Describes any IaaS-specific properties needed to create disks. Examples: `type`, `iops`. Default is `{}` (empty Hash).

Example:

```yaml
disk_types:
- name: default
  disk_size: 2
  cloud_properties:
    type: gp2
```

### CPI Specific `cloud_properties` <a id='disk-types-cloud-properties'></a>

- [See AWS CPI disk type cloud properties](../../../existing-docs/aws-cpi.md#disk-pools)
- [See Azure CPI disk type cloud properties](../../../existing-docs/azure-cpi.md#disk-pools)
- [See OpenStack CPI disk type cloud properties](../../../existing-docs/openstack-cpi.md#disk-pools)
- [See SoftLayer CPI disk type cloud properties](../../../existing-docs/softlayer-cpi.md#disk-pools)
- [See Google Cloud Platform CPI disk type cloud properties](../../../existing-docs/google-cpi.md#disk-pools)
- [See vSphere CPI disk type cloud properties](../../../existing-docs/vsphere-cpi.md#disk-pools)
- [See vCloud CPI disk type cloud properties](../../../existing-docs/vcloud-cpi.md#disk-pools)

---
## Compilation Block <a id='compilation'></a>

The Director creates compilation VMs for release compilation. The Director will compile each release on every necessary stemcell used in a deployment. A compilation definition allows to specify VM characteristics.

**compilation** [Hash, required]: Properties of compilation VMs.

* **workers** [Integer, required]: The maximum number of compilation VMs.
* **az** [String, required]: Name of the AZ defined in AZs section to use for creating compilation VMs.
* **vm_type** [String, optional]: Name of the VM type defined in VM types section to use for creating compilation VMs. Alternatively, you can specify the `vm_resources`, or `cloud_properties` key.
* **vm_resources** [Hash, optional]: Specifies generic VM resources such as CPU, RAM and disk size that are automatically translated into correct VM cloud properties to determine VM size. VM size is determined on best effort basis as some IaaSes may not support exact size configuration. Currently some CPIs (Google and Azure) do not support this functionality. Available in bosh-release v264+.
* **cloud_properties** [Hash, optional]: Describes any IaaS-specific properties needed to create VMs. Most IaaSes require this. Examples: `instance_type`, `availability_zone`. Default is `{}` (empty Hash).
* **network** [String, required]: References a valid network name defined in the Networks block. BOSH assigns network properties to compilation VMs according to the type and properties of the specified network.
* **reuse\_compilation\_vms** [Boolean, optional]: If `false`, BOSH creates a new compilation VM for each new package compilation and destroys the VM when compilation is complete. If `true`, compilation VMs are re-used when compiling packages. Defaults to `false`.
* **env** [Hash, optional]: Same as [`env` for instance groups](manifest-v2.md#instance-groups).

Example:

```yaml
compilation:
  workers: 2
  reuse_compilation_vms: true
  az: z1
  vm_type: default
  network: private
```

## Examples

```yaml
azs:
- name: z1
  cloud_properties: {availability_zone: us-east-1a}
- name: z2
  cloud_properties: {availability_zone: us-east-1b}

vm_types:
- name: small
  cloud_properties:
    instance_type: t2.micro
    ephemeral_disk: {size: 3000, type: gp2}
- name: medium
  cloud_properties:
    instance_type: m3.medium
    ephemeral_disk: {size: 30000, type: gp2}

disk_types:
- name: small
  disk_size: 3000
  cloud_properties: {type: gp2}
- name: large
  disk_size: 50_000
  cloud_properties: {type: gp2}

networks:
- name: private
  type: manual
  subnets:
  - range: 10.10.0.0/24
    gateway: 10.10.0.1
    az: z1
    static: [10.10.0.62]
    dns: [10.10.0.2]
    cloud_properties: {subnet: subnet-f2744a86}
  - range: 10.10.64.0/24
    gateway: 10.10.64.1
    az: z2
    static: [10.10.64.121, 10.10.64.122]
    dns: [10.10.0.2]
    cloud_properties: {subnet: subnet-eb8bd3ad}
- name: vip
  type: vip

compilation:
  workers: 5
  reuse_compilation_vms: true
  az: z1
  vm_type: medium
  network: private
```

- [See AWS CPI example](../../../existing-docs/aws-cpi.md#cloud-config)
- [See Azure CPI example](../../../existing-docs/azure-cpi.md#cloud-config)
- [See OpenStack CPI example](../../../existing-docs/openstack-cpi.md#cloud-config)
- [See SoftLayer CPI example](../../../existing-docs/softlayer-cpi.md#cloud-config)
- [See Google Cloud Platform CPI example](../../../existing-docs/google-cpi.md#cloud-config)
- [See vSphere CPI example](../../../existing-docs/vsphere-cpi.md#cloud-config)

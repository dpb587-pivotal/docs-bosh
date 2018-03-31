The `instance_groups` section is a list of all instance groups which will be managed in this deployment.


## `instance_groups` Schema

The `instance_groups` block is an array of elements which use the following properties.


### **`name`**

*Required*. A unique name used to identify and reference instance group.


### **`azs`**

*Required*. List of AZs associated with this instance group (should only be used when using first class AZs).

Example:

```yaml
azs: [z1, z2]
```

### **`jobs`**

*Required*. Specifies the name and release of jobs that will be installed on each instance.

> #### **`name`**
>
> *Required*. The job name.
>
>
> #### **`release`**
>
> *Required*. The release which has the job.
>
>
> #### **`properties`**
>
> Configuration properties for this job.
>
>
> #### **`provides`**
>
> Links consumed by the job. See the dedicated section on [Links](#).
>
>
> #### **`consumes`**
>
> Links consumed by the job. See the dedicated section on [Links](#).

### **`vm_type`**

*Required*. A valid VM type name from the cloud config. Alternatively you can specify `vm_resources` key.


### **`vm_resources`**

Specifies generic VM resources such as CPU, RAM and disk size that are automatically translated into correct VM cloud properties to determine VM size. VM size is determined on best effort basis as some IaaSes may not support exact size configuration.

!!! note "Minimum Requirements"
    Support for `vm_resources` was added in [bosh/264.1](https://github.com/cloudfoundry/bosh/releases/tag/v264.1). This also requires support from the CPI - review the [documentation](../../clouds/overview.md) for your CPI to see which versions support this feature.

> #### `cpu`
>
> *Required*. Number of CPUs.
>
>
> #### `ram`
>
> *Required*. Amount of RAM in MB.
>
>
> #### `ephemeral_disk_size`
>
> *Required*. Ephemeral disk size in MB.


### **`vm_extensions`**

A list of VM extension names which have previously been defined in [cloud config](../../todo.md).

### **`env`**

Specifies advanced BOSH Agent configuration for each instance in the group.

> #### `bosh`
>
>
> > ##### `password`
> >
> > Crypted password for `vcap`/`root` user (will be placed into `/etc/shadow` on Linux).
> >
> >
> > ##### `keep_root_password`
> >
> > Keep password for `root` and only change password for `vcap`. Default `false`

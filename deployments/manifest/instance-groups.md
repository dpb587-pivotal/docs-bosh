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
> #### **`consumes`**
>
> blah.


### **`vm_resources`**

Specifies generic VM resources such as CPU, RAM and disk size that are automatically translated into correct VM cloud properties to determine VM size. VM size is determined on best effort basis as some IaaSes may not support exact size configuration. Currently some CPIs (Google) do not support this functionality. Available in bosh-release v264+.

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


### **`env`**

Specifies advanced BOSH Agent configuration for each instance in the group.

> #### `bosh`
>
>
> ##### `password`
>
> Crypted password for `vcap`/`root` user (will be placed into `/etc/shadow` on Linux).
>
>
> ##### `keep_root_password`
>
> Keep password for `root` and only change password for `vcap`. Default `false`

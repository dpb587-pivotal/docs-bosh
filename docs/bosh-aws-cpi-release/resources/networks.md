## Cloud Properties

* **`subnet`** (string) &mdash; Subnet ID in which the instance will be created. Example: `subnet-9be6c3f7`.
* `security_groups` ([]string) &mdash; Array of [Security Groups](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html), by name or ID, to apply to all VMs placed on this network. Security groups can be specified as follows, ordered by greatest precedence: `vm_types`, followed by `networks`, followed by `default_security_groups`.


## Examples


### Manual Network

A manual network which uses an account's `subnet-9be6c3f7` subnet and will apply the `bosh` security group. Since it is manual, BOSH will allocate an IP address from the `10.10.0.0/24` network range.

```yaml
networks:
- name: default
  type: manual
  subnets:
  - range: 10.10.0.0/24
    gateway: 10.10.0.1
    cloud_properties:
      subnet: subnet-9be6c3f7
      security_groups: [bosh]
```


### Dynamic Network

```yaml
networks:
- name: default
  type: dynamic
  cloud_properties:
    subnet: subnet-9be6c6gh
```


### VIP Network

```yaml
networks:
- name: default
  type: vip
```

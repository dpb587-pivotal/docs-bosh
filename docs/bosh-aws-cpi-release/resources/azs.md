Availability Zones correspond to [EC2 Availability Zones](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html).

!!! tip
    The CPI is configured to operate within a specific region, so you may only reference that region's availability zones. If you are looking for multi-region support, you can use [multiple CPI configurations](../../../cpi-config.md).


## Cloud Properties

* **`availability_zone`** (string) &mdash; Availability zone to use for creating instances. Example: `us-east-1a`.


## Examples

A single availability zone in `us-east-1a` which deployments can refer to as `z1`.

```yaml
azs:
- name: z1
  cloud_properties:
    availability_zone: us-east-1a
```

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

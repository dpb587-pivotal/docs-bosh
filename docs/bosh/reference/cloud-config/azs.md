# Availability Zones

The `azs` section specifies the availability zones available to deployments. At least one should be specified.

 * *Type*: `array` (of `hash`)
 * *Value*: required


## Schema


### `name`

The `name` represents the name of the availability zone within the director. It can be different from availability names used by the underlying IaaS.

 * *Type*: `string`
 * *Value*: required


### `cloud_properties`

The `cloud_properties` describes IaaS-specific cloud properties needed for associating resources with the availability zones. For most IaaSes, some data here is required.

 * *Type*: `hash`
 * *Value*: optional


## Examples

```yaml
azs:
- name: z1
  cloud_properties:
    availability_zone: us-east-1c
- name: z2
  cloud_properties:
    availability_zone: us-east-1d
```

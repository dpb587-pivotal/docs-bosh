## Cloud Properties

* **`instance_type`** &mdash; string  
  Type of the [instance](http://aws.amazon.com/ec2/instance-types/). Example: `m3.medium`.
* **`availability_zone`** &mdash; string  
  Availability zone to use for creating instances. Example: `us-east-1a`.
* `security_groups` &mdash; []string  
  See description under [networks](#networks). Available in v46+.
* `key_name` &mdash; string  
  Key pair name. Defaults to key pair name specified by `default_key_name` in global CPI settings. Example: `bosh`.
* `spot_bid_price` &mdash; float  
  Bid price in dollars for [AWS spot instance](http://aws.amazon.com/ec2/purchasing-options/spot-instances/). Using this option will slow down VM creation. Example: `0.03`.
* `spot_ondemand_fallback` &mdash; boolean  
  Set to `true` to use an on demand instance if a spot instance is not available during VM creation. Defaults to `false`. Available in v36.
* `elbs` &mdash; []string  
  Array of ELB names that should be attached to created VMs. Example: `[prod-elb]`. Default is `[]`.
* `lb_target_groups` &mdash; []string  
  Array of Load Balancer Target Groups to which created VMs should be attached. Example: `[prod-group1, prod-group2]`. Default is `[]`. Available in v63 or newer.
* `iam_instance_profile` &mdash; string  
  Name of an [IAM instance profile](aws-iam-instance-profiles.md). Example: `director`.
* `placement_group` &mdash; string  
  Name of a [placement group](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html). Example: `my-group`.
* `tenancy` &mdash; string  
  VM [tenancy](http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/dedicated-instance.html) configuration. Example: `dedicated`. Default is `default`.
* `auto_assign_public_ip` &mdash; boolean  
  Assigns a public IP address to the created VM. This IP is ephemeral and may change; use an [Elastic IP](networks.md#vip) instead for a persistent address. Defaults to `false`. Available in v55+.
* `advertised_routes` &mdash; []string  
  Creates routes in an [AWS Route Table](http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html) with the created BOSH VM as the target. Requires IAM action `ec2:CreateRoute`, `ec2:DescribeRouteTables`, `ec2:ReplaceRoute`.
   * **`table_id`** &mdash; string  
     ID of the route table in which to create the route (e.g. `rt-abcdef123`).
   * **`destination`** &mdash; string  
     Destination CIDR for the route. All traffic with a destination within this CIDR will be routed through the created BOSH VM.
* `raw_instance_storage` &mdash; boolean  
  Exposes all available [instance storage via labeled disks](aws-instance-storage.md). Defaults to `false`.
* `source_dest_check` &mdash; boolean  
  Specifies whether the instance must be the source or destination of any traffic it sends or receives. If set to `false`, the instance does *not* need to be the source or destination. Used for network address translation (NAT) boxes, frequently to communicate between VPCs. Defaults to `true`. Requires IAM action `ec2:ModifyInstanceAttribute`. Available in v59+.
* `ephemeral_disk`  
  EBS backed ephemeral disk of custom size. Default disk size is either the size of first instance storage disk, if the instance_type offers it, or 10GB. Before v53: Used EBS only if instance storage is not large enough or not available for selected instance type.
    * **`size`** &mdash; integer  
      Specifies the disk size in megabytes.
    * `type` &mdash; string  
      Type of the [disk](http://aws.amazon.com/ebs/details/): `standard`, `gp2`. Defaults to `gp2`.
        * `standard` stands for EBS magnetic drives
        * `gp2` stands for EBS general purpose drives (SSD)
        * `io1` stands for EBS provisioned IOPS drives (SSD)
    * `iops` &mdash; integer  
      Specifies the number of I/O operations per second to provision for the drive.
        * Only valid for `io1` type drive.
        * Required when `io1` type drive is specified.
    * `encrypted` &mdash; boolean Enables encryption for the EBS backed ephemeral disk. An error is raised, if the `instance_type` does not support it. Since v53. Defaults to `false`. Overrides the global `encrypted` property.
    * `kms_key_arn` &mdash; string The ARN of an Amazon KMS key to use when encrypting the disk.
    * `use_instance_storage` &mdash; boolean Forces the usage of instance storage as ephemeral disk backing. Will raise an error, if the used `instance_type` does not have instance storage. Cannot be combined with any other option under `ephemeral_disk` or with `raw_instance_storage`. Since v53. Defaults to `false`.
* `root_disk`  
  EBS backed root disk of custom size.
    * **`size`** &mdash; integer  
      Specifies the disk size in megabytes.
    * `type` &mdash; string  
      Type of the [disk](http://aws.amazon.com/ebs/details/): `standard`, `gp2`. Defaults to `gp2`.
        * `standard` stands for EBS magnetic drives
        * `gp2` stands for EBS general purpose drives (SSD)
    * `iops` &mdash; integer  
      Specifies the number of I/O operations per second to provision for the drive.
        * Only valid for `io1` type drive.
        * Required when `io1` type drive is specified.


## Examples

Example of an `m3.medium` instance:

```yaml
vm_types:
- name: medium
  cloud_properties:
    instance_type: m3.medium
    availability_zone: us-east-1a
```

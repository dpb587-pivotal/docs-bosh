---
schema: true
---

This topic describes cloud properties for different resources created by the AWS CPI.

## Availability Zones {: #azs }


### `availability_zone`

Availability zone to use for creating instances. Example: `us-east-1a`.

 * *Required*
 * *Type*: String


## Networks {: #networks }

Schema for `cloud_properties` section used by dynamic network or manual network subnet.


### `subnet` {: #networks-subnet}

Subnet ID in which the instance will be created. Example: `subnet-9be6c3f7`.

 * *Required*
 * *Type*: String


### `security_groups[]` {: #networks-security_groups}

Array of [Security Groups](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html), by name or ID, to apply to all VMs placed on this network. Security groups can be specified as follows, ordered by greatest precedence: `vm_types`, followed by `networks`, followed by `default_security_groups`.

 * *Optional*
 * *Type*: String


## Virtual Machines {: #resource-pools }

Schema for `cloud_properties` section:

### `instance_type` {: #vm-instance_type}

Type of the [instance](http://aws.amazon.com/ec2/instance-types/). Example: `m3.medium`.

 * *Required*
 * *Type*: String


### `availability_zone` {: #resource-pools-availability_zone}

Availability zone to use for creating instances. Example: `us-east-1a`.

 * *Required*
 * *Type*: String


### `security_groups[]` {: #resource-pools-security_groups}

See description under [networks](#networks). Available in v46+.

 * *Optional*
 * *Type*: String


### `key_name` {: #resource-pools-key_name}

Key pair name. Defaults to key pair name specified by `default_key_name` in global CPI settings. Example: `bosh`.

 * *Optional*
 * *Type*: String


### `spot_bid_price` {: #resource-pools-spot_bid_price}

Bid price in dollars for [AWS spot instance](http://aws.amazon.com/ec2/purchasing-options/spot-instances/). Using this option will slow down VM creation. Example: `0.03`.

 * *Optional*
 * *Type*: Float


### `spot_ondemand_fallback` {: #resource-pools-spot_ondemand_fallback}

Set to `true` to use an on demand instance if a spot instance is not available during VM creation. Defaults to `false`. Available in v36.

 * *Optional*
 * *Type*: Boolean


### `elbs[]` {: #resource-pools-elbs}

Array of ELB names that should be attached to created VMs. Example: `[prod-elb]`. Default is `[]`.

 * *Optional*
 * *Type*: String


### `lb_target_groups[]` {: #resource-pools-lb_target_groups}

Array of Load Balancer Target Groups to which created VMs should be attached. Example: `[prod-group1, prod-group2]`. Default is `[]`. Available in v63 or newer.

 * *Optional*
 * *Type*: String


### `iam_instance_profile` {: #resource-pools-iam_instance_profile}

Name of an [IAM instance profile](aws-iam-instance-profiles.md). Example: `director`.

 * *Optional*
 * *Type*: String


### `placement_group` {: #resource-pools-placement_group}

Name of a [placement group](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html). Example: `my-group`.

 * *Optional*
 * *Type*: String


### `tenancy` {: #resource-pools-tenancy}

VM [tenancy](http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/dedicated-instance.html) configuration. Example: `dedicated`. Default is `default`.

 * *Optional*
 * *Type*: String


### `auto_assign_public_ip` {: #resource-pools-auto_assign_public_ip}

Assigns a public IP address to the created VM. This IP is ephemeral and may change; use an [Elastic IP](networks.md#vip) instead for a persistent address. Defaults to `false`. Available in v55+.

 * *Optional*
 * *Type*: Boolean


### `advertised_routes[]` {: #resource-pools-advertised_routes}

Creates routes in an [AWS Route Table](http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html) with the created BOSH VM as the target. Requires IAM action `ec2:CreateRoute`, `ec2:DescribeRouteTables`, `ec2:ReplaceRoute`.

 * *Optional*
 * *Type*: Object


> #### `table_id` {: #resource-pools-advertised_routes-table_id }
>
> ID of the route table in which to create the route (e.g. `rt-abcdef123`).
>
>  * *Required*
>  * *Type*: String
>
>
> #### `destination` {: #resource-pools-advertised_routes-destination }
>
> Destination CIDR for the route. All traffic with a destination within this CIDR will be routed through the created BOSH VM.
>
>  * *Required*
>  * *Type*: String


### `raw_instance_storage` {: #resource-pools-raw_instance_storage}

Exposes all available [instance storage via labeled disks](aws-instance-storage.md). Defaults to `false`.

 * *Optional*
 * *Type*: Boolean


### `source_dest_check` {: #resource-pools-source_dest_check}

Specifies whether the instance must be the source or destination of any traffic it sends or receives. If set to `false`, the instance does *not* need to be the source or destination. Used for network address translation (NAT) boxes, frequently to communicate between VPCs. Defaults to `true`. Requires IAM action `ec2:ModifyInstanceAttribute`. Available in v59+.

 * *Optional*
 * *Type*: Boolean


### `ephemeral_disk` {: #resource-pools-ephemeral_disk}

EBS backed ephemeral disk of custom size. Default disk size is either the size of first instance storage disk, if the instance_type offers it, or 10GB. Before v53: Used EBS only if instance storage is not large enough or not available for selected instance type.

 * *Optional*
 * *Type*: Object


> #### `size` {: #resource-pools-ephemeral_disk-size }
>
> Specifies the disk size in megabytes.
>
>  * *Required*
>  * *Type*: Integer
>
>
> #### `type` {: #resource-pools-ephemeral_disk-type }
>
> Type of the [disk](http://aws.amazon.com/ebs/details/): `standard`, `gp2`. Defaults to `gp2`.
>
>  * *Optional*
>  * *Type*: String
>  * *Values*:
>     * `standard` stands for EBS magnetic drives
>     * `gp2` stands for EBS general purpose drives (SSD)
>     * `io1` stands for EBS provisioned IOPS drives (SSD)
>
>
> #### `iops` {: #resource-pools-ephemeral_disk-iops }
>
> Specifies the number of I/O operations per second to provision for the drive.
>
>  * Required and only valid when using `type` of `io1`
>  * *Type*: Integer
>
>
> #### `encrypted` {: #resource-pools-ephemeral_disk-encrypted }
>
> Enables encryption for the EBS backed ephemeral disk. An error is raised, if the `instance_type` does not support it. Since v53. Defaults to `false`. Overrides the global `encrypted` property.
>
>  * *Optional*
>  * *Type*: Boolean
>
>
> #### `kms_key_arn` {: #resource-pools-ephemeral_disk-kms_key_arn }
>
> The ARN of an Amazon KMS key to use when encrypting the disk.
>
>  * *Optional*
>  * *Type*: String
>
>
> #### `use_instance_storage` {: #resource-pools-ephemeral_disk-use_instance_storage }
>
> Forces the usage of instance storage as ephemeral disk backing. Will raise an error, if the used `instance_type` does not have instance storage. Cannot be combined with any other option under `ephemeral_disk` or with `raw_instance_storage`. Since v53. Defaults to `false`.
>
>  * *Optional*
>  * *Type*: Boolean


### `root_disk` {: #resource-pools-root_disk}

EBS backed root disk of custom size.

 * *Optional*
 * *Type*: Object


> #### `size` {: #resource-pools-root_disk-size }
>
> Specifies the disk size in megabytes.
>
>  * *Required*
>  * *Type*: Integer
>
>
> #### `type` {: #resource-pools-root_disk-type }
>
> Type of the [disk](http://aws.amazon.com/ebs/details/): `standard`, `gp2`. Defaults to `gp2`.
>
>  * *Optional*
>  * *Type*: String
>  * *Values*:
>     * `standard` stands for EBS magnetic drives
>     * `gp2` stands for EBS general purpose drives (SSD)
>     * `io1` stands for EBS provisioned IOPS drives (SSD)
>
>
> #### `iops` {: #resource-pools-root_disk-iops }
>
> Specifies the number of I/O operations per second to provision for the drive.
>
>  * Required and only valid when using `type` of `io1`
>  * *Type*: Integer



## Persistent Disks {: #disk-pools }

EBS volumes are created in the availability zone of an instance that volume will be attached. Schema for `cloud_properties` section:

### `type` {: #disk-pools-type}

Type of the [disk](http://aws.amazon.com/ebs/details/): `standard`, `gp2`. Defaults to `gp2`.

Use
:    Required and only valid when using `type` of `io1`

Type
:    String

Values
:      `standard` - EBS magnetic drives
:      `gp2` - EBS general purpose drives (SSD)
:      `io1` - EBS provisioned IOPS drives (SSD)


### `iops` {: #disk-pools-iops}

Specifies the number of I/O operations per second to provision for the drive.

 * Required and only valid when using `type` of `io1`
 * *Type*: Integer


### `encrypted` {: #disk-pools-encrypted}

Turns on [EBS volume encryption](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html) for this persistent disk. VM root and ephemeral disk are not encrypted. Defaults to `false`. Overrides the global `encrypted` property.

 * *Optional*
 * *Type*: Boolean


### `kms_key_arn` {: #disk-pools-kms_key_arn}

Encrypts the disk using an encryption key stored in the [AWS Key Management Service (KMS)](https://aws.amazon.com/kms/). The format of the ID is `XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX`. Be sure to use the Key ID, not the Alias. If omitted the disk will be encrypted using the global `kms_key_arn` property. If, no global `kms_key_arn` is set will use your account's default `aws/ebs` encryption key.

 * *Optional*
 * *Type*: String


## Global Configuration {: #global }

The CPI can only talk to a single AWS region.


### `credentials_source` {: #global-credentials_source }

Selects credentials source between credentials provided in this configuration, or from an [IAM instance profile](aws-iam-instance-profiles.md). Default: `static`.

 * *Optional*
 * *Type*: String


### `access_key_id` {: #global-access_key_id }

Accesss Key ID. Example: `AKI...`.

 * *Optional*
 * *Type*: String


### `secret_access_key` {: #global-secret_access_key }

Secret Access Key. Example: `0kwh...`.

 * *Optional*
 * *Type*: String


### `default_key_name` {: #global-default_key_name }

Name of the [Key Pair](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html) that will be applied to all created VMs. Example: `bosh`

 * *Required*
 * *Type*: String


### `default_security_groups` {: #global-default_security_groups }

See description under [networks](#networks).

 * *Required*
 * *Type*: Array


### `default_iam_instance_profile` {: #global-default_iam_instance_profile }

Name of the [IAM instance profile](aws-iam-instance-profiles.md) that will be applied to all created VMs. Example: `director`.

 * *Optional*
 * *Type*: String


### `region` {: #global-region }

AWS region name. Example: `us-east-1`

 * *Required*
 * *Type*: String


### `max_retries` {: #global-max_retries }

The maximum number of times AWS service errors (500) and throttling errors (`AWS::EC2::Errors::RequestLimitExceeded`) should be retried. There is an exponential backoff in between retries, so the more retries the longer it can take to fail. Defaults to 2.

 * *Optional*
 * *Type*: Integer


### `encrypted` {: #global-encrypted }

Turns on [EBS volume encryption](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html) for all VM's root (system), ephemeral and persistent disks. Defaults to `false`. Available in v67+.

 * *Optional*
 * *Type*: Boolean


### `kms_key_arn` {: #global-kms_key_arn }

Encrypts the disks using an encryption key stored in the [AWS Key Management Service (KMS)](https://aws.amazon.com/kms/). The format of the ID is `XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX`. Be sure to use the Key ID, not the Alias. If this property is omitted and `encrypted` is `true`, the disks will be encrypted using your account's default `aws/ebs` encryption key. Available in v67+.

 * *Optional*
 * *Type*: String

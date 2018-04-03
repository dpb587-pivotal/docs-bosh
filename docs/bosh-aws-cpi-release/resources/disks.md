Persistent disks correspond to [EC2 EBS Volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumes.html). EBS volumes are created in the availability zone of an instance that volume will be attached.


## Cloud Properties

### `type`

Type of the [disk](http://aws.amazon.com/ebs/details/):

 * `standard` stands for EBS magnetic drives
 * `gp2` stands for EBS general purpose drives (SSD)
 * `io1` stands for EBS provisioned IOPS drives (SSD)

Defaults to `gp2`.


### `iops`

Specifies the number of I/O operations per second to provision for the drive.

 * Only valid for `io1` type drive.
 * Required when `io1` type drive is specified.


### `encrypted`

A boolean to enable [EBS volume encryption](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html) for this persistent disk. VM root and ephemeral disk are not encrypted.

Defaults to `false`. Overrides the global `encrypted` property.


### `kms_key_arn`

Encrypts the disk using an encryption key stored in the [AWS Key Management Service (KMS)](https://aws.amazon.com/kms/). The format of the ID is `XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX`. Be sure to use the Key ID, not the Alias. If omitted the disk will be encrypted using the global `kms_key_arn` property. If, no global `kms_key_arn` is set will use your account's default `aws/ebs` encryption key.


## Examples

Example of 10GB disk:

```yaml
disk_types:
- name: default
  disk_size: 10_240
  cloud_properties:
    type: gp2
```

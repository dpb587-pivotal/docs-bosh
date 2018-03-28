## Options

* `credentials_source` [String, optional] &mdash; Selects credentials source between credentials provided in this configuration, or from an [IAM instance profile](aws-iam-instance-profiles.md). Default: `static`.
* `access_key_id` [String, optional] &mdash; Accesss Key ID. Example: `AKI...`.
* `secret_access_key` [String, optional] &mdash; Secret Access Key. Example: `0kwh...`.
* `default_key_name` [String, required] &mdash; Name of the [Key Pair](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html) that will be applied to all created VMs. Example: `bosh`
* `default_security_groups` [Array, required] &mdash; See description under [networks](#networks).
* `default_iam_instance_profile` [String, optional] &mdash; Name of the [IAM instance profile](aws-iam-instance-profiles.md) that will be applied to all created VMs. Example: `director`.
* `region` [String, required] &mdash; AWS region name. Example: `us-east-1`
* `max_retries` [Integer, optional] &mdash; The maximum number of times AWS service errors (500) and throttling errors (`AWS::EC2::Errors::RequestLimitExceeded`) should be retried. There is an exponential backoff in between retries, so the more retries the longer it can take to fail. Defaults to 2.
* `encrypted` [Boolean, optional] &mdash; Turns on [EBS volume encryption](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html) for all VM's root (system), ephemeral and persistent disks. Defaults to `false`. Available in v67+.
* `kms_key_arn` [String, optional] &mdash; Encrypts the disks using an encryption key stored in the [AWS Key Management Service (KMS)](https://aws.amazon.com/kms/). The format of the ID is `XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX`. Be sure to use the Key ID, not the Alias. If this property is omitted and `encrypted` is `true`, the disks will be encrypted using your account's default `aws/ebs` encryption key. Available in v67+.

See [all configuration options](https://bosh.io/jobs/cpi?source=github.com/cloudfoundry-incubator/bosh-aws-cpi-release).


## Examples


### Access and Secret Key

Example with hard-coded credentials:

```yaml
properties:
  aws:
    access_key_id: ACCESS-KEY-ID
    secret_access_key: SECRET-ACCESS-KEY
    default_key_name: bosh
    default_security_groups: [bosh]
    region: us-east-1
```


### IAM Instance Profiles

Example when [IAM instance profiles](aws-iam-instance-profiles.md) are used:

```yaml
properties:
  aws:
    credentials_source: env_or_profile
    default_key_name: bosh
    default_security_groups: [bosh]
    default_iam_instance_profile: deployed-vm
    region: us-east-1
```

The `s3` provider supports using [Amazon S3](https://aws.amazon.com/s3/), or any S3-compatible blobstore like [Google Cloud Storage](https://cloud.google.com/storage/) (in [compatibility mode](https://cloud.google.com/storage/docs/interoperability)) and [OpenStack Swift](https://docs.openstack.org/swift/latest/).


!!! TODO
    improve https://github.com/cloudfoundry/bosh-s3cli docs and refer to those options?


## Options

The follow options may be used in the `blobstore` section of `options`.


### **`bucket_name`**

*Required*. The bucket name to use.


### **`region`**

The [AWS Region](https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region) name where the bucket is located. *Default `us-east-1`*.


### **`credentials_source`**

The method for finding credentials to authenticate with. Must be one of the following:

 * `static` (default) - use hard-coded credentials from `access_key_id` and `secret_access_key`
 * `env_or_profile` - use credentials from environment variables or from IAM instance profile
 * `none` - do not use any authentication


### **`access_key_id`**

The Access Key ID to use in authentication.


### **`secret_access_key`**

The Secret Access Key to use in authentication.


## Examples


### Typical Usage

If using an Amazon S3 bucket in `us-east-1`, the configuration should be minimal.

```yaml
# config/final.yml
blobstore:
  provider: s3
  options:
    bucket_name: acme-exemplar-release-us-east-1
```


### Non-Default AWS Region

When using an Amazon S3 bucket in another region, be sure to specify `region`.

```yaml
# config/final.yml
blobstore:
  provider: s3
  options:
    bucket_name: acme-exemplar-release-eu-west-1
    region: eu-west-1
```


### Static Credentials

This example uses static credentials in the `private.yml` (reminder `private.yml` should never be committed to a release repository).

```yaml
# config/private.yml
blobstore:
  options:
    access_key_id: AKIAA1B2C3D4E5F6G7H8
    secret_access_key: a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0
```


### S3-compatible Endpoint

When using an S3-compatible endpoint, be sure to specify `host`.


```yaml
# config/final.yml
blobstore:
  provider: s3
  options:
    bucket_name: exemplar-release
    host: s3.acme.example.com
```


### Real-world

If you are interested in seeing how some releases are using the `s3` provider for their release:

 * [cloudfoundry/diego-release](https://github.com/cloudfoundry/diego-release/blob/4648e76c4256e93a0e13e10f578a9af9c7951eee/config/final.yml)
 * [cloudfoundry-community/ntp-release](https://github.com/cloudfoundry-community/ntp-release/blob/74ddfa1f8526f4e33fcc891657bfe017f280582f/config/final.yml)
 * [concourse/concourse](https://github.com/concourse/concourse/blob/7bd97380ac329a41a6476101906fc6394c6fefd4/config/final.yml)

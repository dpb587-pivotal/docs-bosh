The S3 provider supports using [Amazon S3](https://aws.amazon.com/s3/), or any S3-compatible blobstore like [Google Cloud Storage](https://cloud.google.com/storage/) (in [compatibility mode](https://cloud.google.com/storage/docs/interoperability)) and [OpenStack Swift](https://docs.openstack.org/swift/latest/).


!!! TODO
    improve https://github.com/cloudfoundry/bosh-s3cli docs and refer to those options?


## Options

The follow options may be used in the `blobstore` section of `options`.


### **`bucket_name`**

*Required*. The bucket name to use.


### **`region`**

The AWS Region name where the bucket is located. *Default `us-east-1`*.


### **`credentials_source`**

The method for finding credentials to authenticate with. Must be one of the following:

 * `static` - use hard-coded credentials from `access_key_id` and `secret_access_key`
 * `env_or_profile` - use credentials from environment variables or from IAM instance profile
 * `none` - do not use any authentication


### **`access_key_id`**

The Access Key ID to use in authentication.


### **`secret_access_key`**

The Secret Access Key to use in authentication.



## Examples


### Using Hard-coded Credentials

**`config/final.yml`**:

```yaml
blobstore:
  provider: s3
  options:
    bucket_name: <bucket_name>
```

**`config/private.yml`**:

```yaml
blobstore:
  options:
    access_key_id: <access_key_id>
    secret_access_key: <secret_access_key>
```


### TODO hostname

See [Configuring S3 release blobstore](s3-release-blobstore.md) for details and [S3 CLI Usage](https://github.com/pivotal-golang/s3cli#usage) for additional configuration options.

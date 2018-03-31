The `gcs` provider supports natively using [Google Cloud Storage](https://cloud.google.com/storage/) (the S3 compatibility mode is not necessary).


!!! TODO
    improve https://github.com/cloudfoundry/bosh-gcscli docs and refer to those options?


## Options

The follow options may be used in the `blobstore` section of `options`.


### **`bucket_name`**

*Required*. The GCS bucket operations will use.


### **`credentials_source`**

The method for finding credentials to authenticate with. Must be one of the following:

 * empty (default) - [Application Default Credentials](https://cloud.google.com/docs/authentication/production) will be used, if available
 * `static` - use use hard-coded credentials from `json_key`
 * `none` - do not use authentication (read-only scope will be used)


### **`json_key`**

The contents of a [JSON Service Account](https://cloud.google.com/storage/docs/authentication#generating-a-private-key) file. Necessary when configuring `credentials_source` as `static`.


### **`storage_class`**

The type of [storage class](https://cloud.google.com/storage/docs/storage-classes) used for objects being added to the bucket.


### **`encryption_key`**

A customer-supplied [encryption key](https://cloud.google.com/storage/docs/encryption) used to encrypt objects added to the bucket.


## Examples


### Typical Usage

```yaml
# config/final.yml
blobstore:
  provider: gcs
  options:
    bucket_name: acme-exemplar-release-us-west1
```


### Static Credentials

This example uses static credentials in the `private.yml` (reminder `private.yml` should never be committed to a release repository).

```yaml
# config/private.yml
blobstore:
  options:
    credentials_source: static
    json_key: |
      {
        "type": "service_account",
        "project_id": "acme-exemplar-release",
        "private_key_id" "a1b2c3d4...snip...",
        ...snip...
      }
```

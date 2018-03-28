The `releases` section is a list of all releases which will be referenced in this deployment.

```yaml
releases:
- name: concourse
  version: "3.9.2"
- name: garden-runc
  version: "1.12.0"
```

## `releases` Schema

The `releases` block is an array of elements which use the following properties. If a deployment will be referencing multiple releases, each release will be one element.


### **`name`**

*Required*. Name of the release. This is the name defined by the release itself.


### **`version`**

*Required*. The version of the release to use.

If you do not care about which version of a release you want, you can use `latest` as the version. This will always use the most recent version (according to [semantic version conventions](https://semver.org/)) which has been uploaded to the director.

Alternatively, if you need to use a specific major version but do not care which minor version, you can use the `1234.latest` convention (where `1234` is the major version you want to stick to).

!!! tip
    The `latest` options are best suited for development. In a production environment, you should use specific versions to avoid unexpected version changes if new versions of a release are uploaded before they should be deployed.

!!! bug
    To avoid versions being treated as numbers, consider quoting values to ensure they stay strings. Some tools may consider an unquoted `4.20` to be the same as `4.2` ([learn more](https://github.com/cloudfoundry/bosh-cli/issues/208)).

### **`url`**

URL of a release to download when the director does not already have it. See below for supported URI schemes.


#### Local Files

If you have a local release tarball create with `bosh create-release`, specify a full path to the file using the `file` scheme.

Example: `file:///tmp/bosh-release.tgz`

!!! note
    The triple slash is intentional. The first two separate the `file` scheme, and the third represents an absolute path.


#### HTTP Downloads

If you have a remotely hosted tarball, specify the URL where it can be downloaded using the `https`/`http` scheme.

Example: `https://bosh.io/d/github.com/cloudfoundry/bosh?v=265.2.0`

!!! note
    When using HTTP downloads, you must specify the `sha1` checksum of the file. This is used to verify the integrity of the download.


#### Git Release Repository

If you want to refer to a release repository directly, use the `git+https`/`git+http` scheme. Internally, the CLI will perform a shallow copy before running `upload-release`.

Example: `git+https://github.com/cloudfoundry/syslog-release.git`



### **`sha1`**

The SHA1 of assets referenced by remote `url`s.


## Examples

```yaml
releases:
- name: redis
  version: 12
```

Example with a URL:

```yaml
releases:
- name: concourse
  version: 3.3.2
  url: https://bosh.io/d/github.com/concourse/concourse?v=3.3.2
  sha1: 2c876303dc6866afb845e728eab58abae8ff3be2
```

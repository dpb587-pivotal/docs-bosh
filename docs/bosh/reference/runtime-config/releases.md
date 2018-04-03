# Releases

The `releases` section specifies releases which are referenced in the runtime config.


## Schema


### `name`

The `name` must be the release name.

 * Required
 * Type: `string`


### `version`

The `version` must be the release version to use. Due to the shared nature of runtime configs, a version of `latest` must not be used; it must be an explicit version.

 * Required
 * Type: `string`


### `url`

The `url` may specify a source for downloading the release if it is not already present on the director. This behavior is handled by the CLI. For more information, see [Release URLs](../release-urls.md).

 * Optional
 * Type: `string`


### `sha1`

The `sha1` should specify the checksum when `url` is used to download release tarballs. For more information, see [Release URLs](../release-urls.md).

 * Optional
 * Type: `string`


## Examples


### Basic Release Reference

```yaml
releases:
- name: strongswan
  version: 6.0.0
```


### URL-referencing Release

```yaml
releases:
- name: concourse
  version: 3.3.2
  url: https://bosh.io/d/github.com/concourse/concourse?v=3.3.2
  sha1: 2c876303dc6866afb845e728eab58abae8ff3be2
```

# Addons

The `addons` section is used to colocate a release job onto all VMs managed by the Director.


## Schema


### `name`

The `name` must be a unique name (within the config) to identify and reference the addon.

 * Required
 * Type: `string`


### `jobs[]`

The `jobs` section specifies the release jobs which should be installed.

 * Required
 * Type: `[]hash`


#### `name`

The `name` must be a release job name.

 * Required
 * Type: `string`


#### `release`

The `release` must be a release name which is referenced by the [`releases`](releases.md) section.

 * Required
 * Type: `string`


#### `properties`

The `properties` section should be the configuration for the given job properties.

 * Optional
 * Type: `hash`


#### `exclude`

The `exclude` section may specify exclusion [placement rules](index.md#using-placement-rules).

 * Optional
 * Type: `hash`
 * Since: bosh/v260


#### `include`

The `include` section may specify inclusion [placement rules](index.md#using-placement-rules).

 * Optional
 * Type: `hash`
 * Since: bosh/v260


## Examples

```yaml
releases:
- name: strongswan
  version: 6.0.0

addons:
- name: security
  jobs:
  - name: strongswan
    release: strongswan
    properties:
      strongswan:
        ca_cert: ...
  include:
    deployments:
    - secure-dep1
    - secure-dep2
```

---
schema: true
---

# Runtime Config Schema

The runtime config defines IaaS-agnostic configuration which applies to all deployments.

!!! info
    Support for runtime configs was first introduced in [bosh/v255.4](https://github.com/cloudfoundry/bosh/releases/tag/stable-3213).


## `releases[]` {: #releases }

Specifies the releases used by the addons.

 * *Required*
 * *Type*: Array of Objects

> ### `name` {: #releases-name }
>
> Name of a release name used by an addon.
>
>  * *Required*
>  * *Type*: String
>
>
> ### `version` {: #vreleases-ersion }
>
> The version of the release to use. Version *cannot* be `latest`; it must be specified explicitly.
>
>  * *Required*
>  * *Type*: String
>
>
> ### `url` {: #releases-url }
>
> URL of a release to download. Works with CLI v2.
>
>  * *Optional*
>  * *Type*: String
>
>
> ### `sha1` {: #releases-sha1 }
>
> SHA1 of asset referenced via URL. Works with CLI v2.
>
>  * *Optional*
>  * *Type*: String
>

## `addons[]` {: #addons }

Specifies the [addons](terminology.md#addon) to be applied to all deployments.

> ### `name` {: #addons-name }
>
> A unique name used to identify and reference the addon.
>
>  * *Required*
>  * *Type*: String
>
>
> ### `jobs[]` {: #addons-jobs }
>
> Specifies the name and release of release jobs to be colocated.
>
>  * *Required*
>  * *Type*: Array of Objects
>
>
> > #### `name` {: #addons-jobs-name }
> >
> > The job name.
> >
> >  * *Required*
> >  * *Type*: String
> >
> >
> > #### `release` {: #addons-jobs-release }
> >
> > The release where the job exists.
> >
> >  * *Required*
> >  * *Type*: String
> >
> >
> > #### `properties` {: #addons-jobs-properties }
> >
> > Specifies job properties. Properties allow the Director to configure jobs to a specific environment.
> >
> >  * *Optional*
> >  * *Type*: Object
>
> ### `include` {: #addons-include }
>
> Specifies inclusion [placement rules](#placement-rules).
>
>  * *Optional*
>  * *Type*: Object
>  * *Since*: [bosh/v260](https://github.com/cloudfoundry/bosh/releases/tag/v260)
>
> ### `exclude` {: #addons-exclude }
>
> Specifies exclusion [placement rules](#placement-rules).
>
>  * *Optional*
>  * *Type*: Object
>  * *Since*: [bosh/v260](https://github.com/cloudfoundry/bosh/releases/tag/v260)
>

## `tags` {: #tags }

Specifies key value pairs to be sent to the CPI for VM tagging. Combined with deployment level tags during the deploy.

 * *Optional*
 * *Type*: Object
 * *Since*: [bosh/v260](https://github.com/cloudfoundry/bosh/releases/tag/v260)


---


## Placement Rules

Filters which may be used with the `include` and `exclude` options.


> ### `stemcell[]` {: #placement-rules-stemcell }
>
>  * *Optional*
>  * *Type*: Array of Objects
>
>
> > #### `os` {: #placement-rules-stemcell-os }
> >
> > Matches stemcell's operating system (e.g. `ubuntu-trusty`)
> >
> >  * *Required*
> >  * *Type*: string
> >
> >
> ### `deployments[]` {: #placement-rules-deployments }
>
> Matches based on deployment names.
>
>  * *Optional*
>  * *Type*: Array of Strings
>
>
> ### `jobs[]` {: #placement-rules-jobs }
>
>  * *Optional*
>  * *Type*: Array of Objects
>
>
> > #### `name` {: #placement-rules-jobs-name }
> >
> > Matching job name.
> >
> >  * *Required*
> >  * *Type*: String
> >
> >
> > #### `release` {: #placement-rules-jobs-release }
> >
> > Matching release name.
> >
> >  * *Required*
> >  * *Type*: String
> >
> >
> ### `networks[]` {: #placement-rules-networks }
>
> Matches based on network names.
>
>  * *Optional*
>  * *Type*: Array of Strings
>  * *Since*: [bosh/v262](https://github.com/cloudfoundry/bosh/releases/tag/v262)

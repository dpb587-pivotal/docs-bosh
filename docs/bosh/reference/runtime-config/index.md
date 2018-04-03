# Runtime Config

Operators typically want to ensure that certain software runs on all VMs managed by the Director. Examples of such software are:

- security agents like Tripwire, IPsec, etc.
- anti-viruses like McAfee
- custom health monitoring agents like Datadog
- logging agents like Loggregator's Metron


## Schema

The runtime configuration has several sections which may be used:

 * [`releases`](releases.md)
 * [`addons`](addons.md)
 * [`tags`](tags.md)


## Using Placement Rules

Available rules:

* **stemcell** [Array of hashes, optional]
  * **os** [String, required]: Matches stemcell's operating system. Example: `ubuntu-trusty`
* **deployments** [Array of strings, optional]: Matches based on deployment names.
* **jobs** [Array of hashes, optional]
  * **name** [String, required]: Matching job name.
  * **release** [String, required]: Matching release name.
* **networks** [Array of strings, optional]: Matches based on network names. Available in bosh-release v262+.

All arrays within inclusion/exclusion rules use `or` operator.

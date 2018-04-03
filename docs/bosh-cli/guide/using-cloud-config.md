# Using Cloud Config

## About Cloud Config

One of the goals of BOSH is to try and separate IaaS-specific configuration from the configuration required to deploy actual software. By configuring these separately, it becomes possible to deploy a single cluster configuration on multiple IaaSes or even across IaaSes. The "cloud config" is the configuration holding all IaaS-specific configuration.

We will get into more detail later, but, briefly, the cloud config includes some details on how to compile software and the following high-level resource types:

 * Availability Zones
 * Disk Types
 * Networks
 * VM Types
 * VM Extensions

 When you create a new director, it starts out without a cloud config. Before getting too far on a new director, you will typically want to update it with a cloud config.

!!! note
    These examples will refer to the Director created by [Deploying BOSH Director with VirtualBox](../../bosh-deployment/guide/virtualbox/installation.md). For other directors, the commands will be the same, but you may find `cloud-config.yml` coming from a slightly different source.


## Setting Cloud Config

In order to update the cloud config on the director, we will use the `update-cloud-config` command. For our Director, we can use the sample [`warden/cloud-config.yml`](https://github.com/cloudfoundry/bosh-deployment/blob/master/warden/cloud-config.yml) as the first argument to the command. The CLI will provide you with a diff before asking for confirmation for the change.

```shell
$ bosh -e virtualbox update-cloud-config bosh-deployment/warden/cloud-config.yml
```

!!! question "Frequently Asked Question"
    *Why are we using `cloud-config.yml` from `warden` instead of `virtualbox`?*

    Because, while technically our director is running in a VirtualBox VM, the "cloud" our director will be operating against is a container-backed system historically known as "warden".

    If the "cloud" for our director were VirtualBox and it was going to create other VirtualBox VMs... then we would have wanted `virtualbox/cloud-config.yml`.


## Reviewing Cloud Config

Even though the command told us the update succeeded, we can verify the Director's cloud config by using the `cloud-config` command. The command will show us the current configuration that director has:

```shell
$ bosh -e virtualbox cloud-config
```

The output of `cloud-config` should be the same as if you open [`bosh-deployment/warden/cloud-config.yml`](https://github.com/cloudfoundry/bosh-deployment/blob/master/warden/cloud-config.yml) yourself.

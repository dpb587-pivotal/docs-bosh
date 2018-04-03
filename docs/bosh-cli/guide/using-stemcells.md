# Using Stemcells

## About Stemcells

In the BOSH ecosystem, a "stemcell" is a bare-minimum operating system with: some common, shared packages; well-configured, secure defaults; a BOSH-specific Agent; and a small amount of IaaS-specific configuration. This stemcell is used as the base image when starting a Virtual Machine, and the BOSH Agent running on it will take care of installing the processes and configuration the VM will ultimately need.

All stemcells, regardless of their IaaS or hypervisor, are produced from the same, base operating system image. This separation of OS image and IaaS-specifics allow BOSH users to quickly and reliably switch between different infrastructures without concern. Technically, when you compile software on a stemcell in Google Cloud Platform, the exact same bits can run on the equivalent stemcell in Amazon Web Services.

!!! note
    These examples will refer to the Director created by [Deploying BOSH Director with VirtualBox](../../bosh-deployment/guide/virtualbox/installation.md). For other directors, the commands will be the same, but you may end up using different stemcells.


## Finding Stemcells

You can find all of the official stemcells by visiting [bosh.io/stemcells](https://bosh.io/stemcells). When looking for a stemcell, there are two key things you should keep in mind: your desired Operating System; and your IaaS.


## Uploading a Stemcell

Before our director can create any virtual machines, we are going to need to give it a stemcell. To do that, we can use the `upload-stemcell` command to tell Director where it can download the stemcell. We should also give it the checksum so it can verify the download.

```shell
$ bosh -e virtualbox upload-stemcell \
  https://s3.amazonaws.com/bosh-core-stemcells/warden/bosh-stemcell-3541.9-warden-boshlite-ubuntu-trusty-go_agent.tgz \
  --sha1 44138ff5e30cc1d7724d88eaa70fab955b8011bd
```

!!! info
    Stemcells can range in size from a few kilobytes (for IaaS-managed images) to several hundred megabytes. The BOSH Lite Warden stemcell is one of the larger ones, so the download may take a few minutes.

Alternatively, if you download the stemcell from your browser, you can also use a local file path with `upload-stemcell`:

```shell
$ bosh -e virtualbox upload-stemcell \
  ~/Downloads/bosh-stemcell-3541.9-warden-boshlite-ubuntu-trusty-go_agent.tgz
```


## Listing Stemcells

Once you have uploaded a stemcell, we can use the `stemcells` command to see what stemcells are available on the Director:

```shell
$ bosh -e virtualbox stemcells
Name                                         Version  OS             CPI  CID  
bosh-warden-boshlite-ubuntu-trusty-go_agent  3541.9   ubuntu-trusty  -    85fdc733-409e-44d2-62f0-fc2efcff9c45  
```

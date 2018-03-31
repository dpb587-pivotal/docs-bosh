---
title: Create an Environment
---

The easiest and recommended way to deploy a director is through [cloudfoundry/bosh-deployment](https://github.com/cloudfoundry/bosh-deployment). The `bosh-deployment` repository contains preconfigured manifests to help you quickly get a director up and running in popular IaaSes.


## Prerequisites

Before getting started, make sure you have completed the following steps.

1. Install the BOSH CLI ([instructions](cli/installation.md)).
1. Clone the `bosh-deployment` repository locally.

    ```shell
    $ git clone https://github.com/cloudfoundry/bosh-deployment.git
    ```

1. Create a directory to keep state and configuration about your director.

    ```shell
    $ mkdir bosh-1
    ```


## IaaS-Specifics

Once you have completed those steps, choose the IaaS you would like to get started with:

 * [Local Machine (VirtualBox)](bosh-lite.md) (recommended for quick tests)
 * [Amazon Web Services](init-aws.md)
 * [Google Cloud Platform](init-google.md)
 * [Microsoft Azure](init-azure.md)
 * [OpenStack](init-openstack.md)
 * [SoftLayer](init-softlayer.md)
 * [VMware vCloud](init-vcloud.md)
 * [VMware vSphere](init-vsphere.md)

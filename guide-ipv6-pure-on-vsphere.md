---
title: Pure IPv6 on vSphere
---

<p class="note">This document is work in progress.</p>

---
## Pure IPv6 Configuration {: #pure }

In this example, we use the BOSH CLI and `bosh-deployment` to deploy a Director with an IPv6 address and then deploy VMs with IPv6 addresses.

### Prerequisites

- vCenter Server is accessible via IPv6 address

- ESXi servers (that will be used for stemcell uploading) are accessible via IPv6 addresses

- The workstation where `bosh create-env` command is executed must be able to reach the Director's assigned IPv6 address (the workstation must also have an IPv6 address).

- All IPv6 address *must* be specified in expanded format, leading zeroes, no double-colons. This applies to all variables, deployment manifests, cloud config, etc.

- The `internal_gw` (gateway) must be in the same IPv6 subnet as the Director. If the gateway is a [link-local](https://en.wikipedia.org/wiki/IPv6_address#Local_addresses) (it starts with `fe80:`) you can strip the [modified EUI-64](https://en.wikipedia.org/wiki/IPv6_address#Modified_EUI-64) so that gateway IP is within your chosen subnet. For example, if the default IPv6 gateway is `fe80::20d:b9ff:fe48:9249`, the gateway IP in the BOSH manifest would be `fddf:9b0b:7aac:ac45:20d:b9ff:fe48:9249`.

- Use Simple DNS's [generator](http://simpledns.com/private-ipv6) to obtain a _private_ IPv6 address range.

### Steps

1. To deploy the Director use `bosh create-env` command with additional IPv6-specific ops files. See [Creating environment on vSphere](init-vsphere.md) for more details on initializing Director on vSphere.

    ```shell
    # Create directory to keep state
    $ mkdir ipv6 && cd ipv6

    # Clone Director templates
    $ git clone https://github.com/cloudfoundry/bosh-deployment

    $ bosh create-env bosh-deployment/bosh.yml \
        --state=state.json \
        --vars-store=creds.yml \
        -o bosh-deployment/vsphere/cpi.yml \
        -o bosh-deployment/vsphere/resource-pool.yml \
        -o bosh-deployment/jumpbox-user.yml \
        -o bosh-deployment/uaa.yml \
        -o bosh-deployment/credhub.yml \
        -o bosh-deployment/misc/ipv6/bosh.yml \
        -o bosh-deployment/misc/ipv6/uaa.yml \
        -o bosh-deployment/misc/ipv6/credhub.yml \
        -v director_name=ipv6 \
        -v internal_cidr=fddf:9b0b:7aac:ac45:0000:0000:0000:0000/64 \
        -v internal_gw=fddf:9b0b:7aac:ac45:0000:0000:0000:0001 \
        -v internal_ip=fddf:9b0b:7aac:ac45:0000:0000:0000:0108 \
        -v network_name="VM Network" \
        -v vcenter_dc=dc \
        -v vcenter_cluster=cl \
        -v vcenter_rp=IPv6 \
        -v vcenter_ds=SSD-0 \
        -v vcenter_ip=\"[fd36:c71a:6f0c:2d1e:0000:0000:0000:0105]\" \
        -v vcenter_user=administrator@vsphere.local \
        -v vcenter_password=TheClothesMakethTheMan \
        -v vcenter_templates=bosh-ipv6-templates \
        -v vcenter_vms=bosh-ipv6-vms \
        -v vcenter_disks=bosh-ipv6-disks
    ```

1. Connect to the Director:

    ```shell
    $ bosh alias-env ipv6 -e https://[fddf:9b0b:7aac:ac45:0000:0000:0000:0108]:25555 --ca-cert <(bosh int ./creds.yml --path /director_ssl/ca)
    $ export BOSH_CLIENT=admin
    $ export BOSH_CLIENT_SECRET=`bosh int ./creds.yml --path /admin_password`
    ```

1. Confirm that it works:

    ```shell
    $ bosh -e ipv6 env
    Using environment 'fddf:9b0b:7aac:ac45:0000:0000:0000:0108' as '?'

    Name: ...
    User: admin

    Succeeded
    ```

### Deploy example Zookeeper deployment {: #pure-deploy }

Follow steps below or the [deploy workflow](basic-workflow.md) that goes through the same steps but with more explanation.

1. Update configs

    ```shell
    $ bosh -e ipv6 update-cloud-config ~/workspace/bosh-deployment/vsphere/cloud-config.yml \
        -v vcenter_cluster=cl \
        -v internal_cidr=fddf:9b0b:7aac:ac45:0000:0000:0000:0000/64 \
        -v internal_gw=fddf:9b0b:7aac:ac45:0000:0000:0000:0001 \
        -v network_name="VM Network"

    $ bosh -e ipv6 update-runtime-config ~/workspace/bosh-deployment/runtime-configs/dns.yml
    ```

1. Upload stemcell

    ```shell
    $ bosh -e ipv6 upload-stemcell https://bosh.io/d/stemcells/bosh-vsphere-esxi-ubuntu-trusty-go_agent?v=3468.17 \
      --sha1 1691f18b9141ac59aec893a1e8437a7d68a88038
    ```

    Note that IPv6 is currently only available for Ubuntu Trusty stemcells.

1. Deploy example deployment and see IPv6 addresses

    ```shell
    $ bosh -e ipv6 -d zookeeper deploy <(wget -O- https://raw.githubusercontent.com/cppforlife/zookeeper-release/master/manifests/zookeeper.yml)
    # todo use_dns_addresses update

    $ bosh -e ipv6 -d zookeeper instances
    ```

1. Run Zookeeper smoke tests

    ```shell
    $ bosh -e ipv6 -d zookeeper run-errand smoke-tests
    ```

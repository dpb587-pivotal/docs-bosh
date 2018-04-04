![Cloud Foundry BOSH](images/logo-full.png)

BOSH is a project that unifies release engineering, deployment, and lifecycle management of small and large-scale cloud software. BOSH can provision and deploy software over hundreds of VMs. It also performs monitoring, failure recovery, and software updates with zero-to-minimal downtime.

While BOSH was developed to deploy Cloud Foundry PaaS, it can also be used to deploy almost any other software (Hadoop, for instance). BOSH is particularly well-suited for large distributed systems. In addition, BOSH supports multiple Infrastructure as a Service (IaaS) providers like VMware vSphere, Google Cloud Platform, Amazon Web Services EC2, and OpenStack. There is a Cloud Provider Interface (CPI) that enables users to extend BOSH to support additional IaaS providers such as Apache CloudStack and VirtualBox.


## Downloads

### CLI (v3.0.1)

The [`bosh` CLI](existing-docs/cli-v2.md) is the command line tool used for interacting with all things BOSH.


| Operatig System | Binary (SHA1) |
| --------------- | --------------- |
| Darwin / macOS  | [bosh-cli-3.0.1-darwin-amd64](https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-3.0.1-darwin-amd64) (`d2fea20210a47b8c8f1f7dbb27ffb5808d47ce87`) |
| Linux           | [bosh-cli-3.0.1-linux-amd64](https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-3.0.1-linux-amd64) (`ccc893bab8b219e9e4a628ed044ebca6c6de9ca0`) |
| Windows         | [bosh-cli-3.0.1-windows-amd64.exe](https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-3.0.1-windows-amd64.exe) (`41c23c90cab9dc62fa0a1275dcaf64670579ed33`) |


### Stemcells

[Stemcells](existing-docs/stemcell.md) are the base images of the virtual machines managed by BOSH.


#### Ubuntu Trusty (v3541.10)

| Infrastructure        | Version | Tarball          (SHA1)                                                                                                                                                      |
| --------------------- |:-------:| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Amazon Web Services   | [3541.10](bosh-linux-stemcell-builder/release-notes/3541.x.md#3541.10) | [Download](https://s3.amazonaws.com/bosh-core-stemcells/aws/bosh-stemcell-3541.10-aws-xen-hvm-ubuntu-trusty-go_agent.tgz) (`73313fececadd390c98a4dbde0c289f5b3bd795f`)<br>[Light Download](https://s3.amazonaws.com/bosh-aws-light-stemcells/light-bosh-stemcell-3541.10-aws-xen-hvm-ubuntu-trusty-go_agent.tgz) (`c1f35b57d59639321e2662fd69c69918f3bffda5`) |
| Google Cloud Platform | [3541.10](bosh-linux-stemcell-builder/release-notes/3541.x.md#3541.10) | [Download](https://s3.amazonaws.com/bosh-core-stemcells/google/bosh-stemcell-3541.10-google-kvm-ubuntu-trusty-go_agent.tgz) (`29623d3fe25371ed6d7b709510dadad77a3081b5`)<br>[Light Download](https://s3.amazonaws.com/bosh-gce-light-stemcells/light-bosh-stemcell-3541.10-google-kvm-ubuntu-trusty-go_agent.tgz) (`842e8dce585a4f04bd461667f77d468903e452ea`) |
| Microsoft Azure       | [3541.10](bosh-linux-stemcell-builder/release-notes/3541.x.md#3541.10) | [Download](https://s3.amazonaws.com/bosh-core-stemcells/azure/bosh-stemcell-3541.10-azure-hyperv-ubuntu-trusty-go_agent.tgz) (`60a6561e0bfe48d92acd40e38708d061799103f4`) |
| OpenStack             | [3541.10](bosh-linux-stemcell-builder/release-notes/3541.x.md#3541.10) | [Download](https://s3.amazonaws.com/bosh-core-stemcells/openstack/bosh-stemcell-3541.10-openstack-kvm-ubuntu-trusty-go_agent.tgz) (`bcce3d6cef5e3882c214c078873793fd477db60d`) |
| OpenStack (raw)       | [3541.10](bosh-linux-stemcell-builder/release-notes/3541.x.md#3541.10) | [Download](https://s3.amazonaws.com/bosh-core-stemcells/openstack/bosh-stemcell-3541.10-openstack-kvm-ubuntu-trusty-go_agent-raw.tgz) (`939bfa7ecf9787cefd00700c1f2baa58e6bd3e38`) |
| SoftLayer             | [3541.9](bosh-linux-stemcell-builder/release-notes/3541.x.md#3541.9)  | [Download](https://s3.amazonaws.com/bosh-softlayer-cpi-stemcells/light-bosh-stemcell-3541.9-softlayer-xen-ubuntu-trusty-go_agent.tgz) (`f613314947c292c1da1114a3e3e4837a2f736124`) |
| VMware vCloud         | [3541.10](bosh-linux-stemcell-builder/release-notes/3541.x.md#3541.10) | [Download](https://s3.amazonaws.com/bosh-core-stemcells/vcloud/bosh-stemcell-3541.10-vcloud-esxi-ubuntu-trusty-go_agent.tgz) (`b69b91b290b1af2e7cfb6d7ceb9b5c19602d0aed`) |
| VMware vSphere        | [3541.10](bosh-linux-stemcell-builder/release-notes/3541.x.md#3541.10) | [Download](https://s3.amazonaws.com/bosh-core-stemcells/vsphere/bosh-stemcell-3541.10-vsphere-esxi-ubuntu-trusty-go_agent.tgz) (`6c32b606c02d9732ab3540c4b74c9cd527328951`) |
| BOSH Lite Warden      | [3541.10](bosh-linux-stemcell-builder/release-notes/3541.x.md#3541.10) | [Download](https://s3.amazonaws.com/bosh-core-stemcells/warden/bosh-stemcell-3541.10-warden-boshlite-ubuntu-trusty-go_agent.tgz) (`11c07b63953710d68b7f068e0ecb9cb8f7e64f6a`) |


#### Windows 2016 (v1709.4)

| Infrastructure        | Version | Tarball          (SHA1)                                                                                                                                                      |
| --------------------- |:-------:| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Google Cloud Platform | [1709.4](bosh-linux-stemcell-builder/release-notes/3541.x.md#1709.4) | [Light Download](https://bosh-windows-stemcells-production.s3.amazonaws.com/1709/light-bosh-stemcell-1709.4-google-kvm-windows2016-go_agent.tgz) (`c45e200e532e41631d3a78a8b731cc83af103258`) |
| Microsoft Azure       | [1709.4](bosh-linux-stemcell-builder/release-notes/3541.x.md#1709.4) | [Light Download](https://bosh-windows-stemcells-production.s3.amazonaws.com/1709/light-bosh-stemcell-1709.4-azure-hyperv-windows2016-go_agent.tgz) (`85f43f612e00b24230a3a180e7e7a9b6bf6be9ed`) |


#### Windows 2012 (v1200.16)

| Infrastructure        | Version | Tarball          (SHA1)                                                                                                                                                      |
| --------------------- |:-------:| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Amazon Web Services   | [1200.16](bosh-linux-stemcell-builder/release-notes/3541.x.md#1200.16) | [Light Download](https://bosh-windows-stemcells-production.s3.amazonaws.com/light-bosh-stemcell-1200.16-aws-xen-hvm-windows2012R2-go_agent.tgz) (`0cd18b751db4862995ee0ef425e362ede4f8549c`) |
| Google Cloud Platform | [1200.16](bosh-linux-stemcell-builder/release-notes/3541.x.md#1200.16) | [Light Download](https://bosh-windows-stemcells-production.s3.amazonaws.com/light-bosh-stemcell-1200.16-google-kvm-windows2012R2-go_agent.tgz) (`f661fca64bab94cc4f1d3e117f0b39412a7bf237`) |
| Microsoft Azure       | [1200.16](bosh-linux-stemcell-builder/release-notes/3541.x.md#1200.16) | [Light Download](https://bosh-windows-stemcells-production.s3.amazonaws.com/light-bosh-stemcell-1200.16-azure-hyperv-windows2012R2-go_agent.tgz) (`e0db00dcd91f28234b897f0d874a934dfb6f0a53`) |


#### CentOS 7 (v3541.10)

| Infrastructure        | Version | Tarball          (SHA1)                                                                                                                                                      |
| --------------------- |:-------:| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Amazon Web Services   | [3541.10](bosh-linux-stemcell-builder/release-notes/3541.x.md#3541.10) | [Download](https://s3.amazonaws.com/bosh-core-stemcells/aws/bosh-stemcell-3541.10-aws-xen-hvm-ubuntu-trusty-go_agent.tgz) (`73313fececadd390c98a4dbde0c289f5b3bd795f`)<br>[Light Download](https://s3.amazonaws.com/bosh-aws-light-stemcells/light-bosh-stemcell-3541.10-aws-xen-hvm-ubuntu-trusty-go_agent.tgz) (`c1f35b57d59639321e2662fd69c69918f3bffda5`) |
| Google Cloud Platform | [3541.10](bosh-linux-stemcell-builder/release-notes/3541.x.md#3541.10) | [Download](https://s3.amazonaws.com/bosh-core-stemcells/google/bosh-stemcell-3541.10-google-kvm-ubuntu-trusty-go_agent.tgz) (`29623d3fe25371ed6d7b709510dadad77a3081b5`)<br>[Light Download](https://s3.amazonaws.com/bosh-gce-light-stemcells/light-bosh-stemcell-3541.10-google-kvm-ubuntu-trusty-go_agent.tgz) (`842e8dce585a4f04bd461667f77d468903e452ea`) |
| Microsoft Azure       | [3541.10](bosh-linux-stemcell-builder/release-notes/3541.x.md#3541.10) | [Download](https://s3.amazonaws.com/bosh-core-stemcells/azure/bosh-stemcell-3541.10-azure-hyperv-ubuntu-trusty-go_agent.tgz) (`60a6561e0bfe48d92acd40e38708d061799103f4`) |
| OpenStack             | [3541.10](bosh-linux-stemcell-builder/release-notes/3541.x.md#3541.10) | [Download](https://s3.amazonaws.com/bosh-core-stemcells/openstack/bosh-stemcell-3541.10-openstack-kvm-ubuntu-trusty-go_agent.tgz) (`bcce3d6cef5e3882c214c078873793fd477db60d`) |
| OpenStack (raw)       | [3541.10](bosh-linux-stemcell-builder/release-notes/3541.x.md#3541.10) | [Download](https://s3.amazonaws.com/bosh-core-stemcells/openstack/bosh-stemcell-3541.10-openstack-kvm-ubuntu-trusty-go_agent-raw.tgz) (`939bfa7ecf9787cefd00700c1f2baa58e6bd3e38`) |
| VMware vCloud         | [3541.10](bosh-linux-stemcell-builder/release-notes/3541.x.md#3541.10) | [Download](https://s3.amazonaws.com/bosh-core-stemcells/vcloud/bosh-stemcell-3541.10-vcloud-esxi-ubuntu-trusty-go_agent.tgz) (`b69b91b290b1af2e7cfb6d7ceb9b5c19602d0aed`) |
| VMware vSphere        | [3541.10](bosh-linux-stemcell-builder/release-notes/3541.x.md#3541.10) | [Download](https://s3.amazonaws.com/bosh-core-stemcells/vsphere/bosh-stemcell-3541.10-vsphere-esxi-ubuntu-trusty-go_agent.tgz) (`6c32b606c02d9732ab3540c4b74c9cd527328951`) |
| BOSH Lite Warden      | [3541.10](bosh-linux-stemcell-builder/release-notes/3541.x.md#3541.10) | [Download](https://s3.amazonaws.com/bosh-core-stemcells/warden/bosh-stemcell-3541.10-warden-boshlite-ubuntu-trusty-go_agent.tgz) (`11c07b63953710d68b7f068e0ecb9cb8f7e64f6a`) |

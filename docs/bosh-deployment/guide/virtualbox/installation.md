# Deploying BOSH Director with VirtualBox

One of the easiest ways to get started with a BOSH Director is by creating a virtual machine using [VirtualBox](https://www.virtualbox.org/). This will allow you to have a real Director to experiment on, without needing to go through additional, IaaS-specific setup steps. Most examples in the documentation will refer a director running in VirtualBox, but the same principles will apply wherever your director is running.


## Prerequisites

Before trying to deploy the Director, make sure you have satisfied the following requirements:

1. Check that your machine has at least 8GB RAM, and 20GB of free disk space. Smaller configurations may work.

1. Install the [BOSH CLI](/bosh-cli/guide/installation.md) and its [additional dependencies](/bosh-cli/guide/installing-env-dependencies.md).

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads). You can verify the installation by running `VBoxManage`:

     ```shell
     $ VBoxManage --version
     5.1...
     ````

    !!! tip
        If you encounter problems with VirtualBox networking try installing [Oracle VM VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads) as suggested by [Issue 202](https://github.com/cloudfoundry/bosh-lite/issues/202). Alternatively make sure you are on VirtualBox 5.1+ since previous versions had a [network connectivity bug](https://github.com/concourse/concourse-lite/issues/9).


## Install

Once you have the prerequisites worked out, we are ready to start deploying Director. As part of the bootstrapping process, we will need a place to store some configuration and state files which will be automatically generated for us. For this example, let's use and work from the `~/bosh-envs/virtualbox` directory:

```shell
$ mkdir -p ~/bosh-env/virtualbox
$ cd ~/bosh-env/virtualbox
```

Next, we should use the [bosh-deployment](https://github.com/cloudfoundry/bosh-deployment) repository to help bootstrap our director. The deployment repository is the recommended way to create a BOSH Director since it has some pre-configured, recommended settings. Make sure we have cloned that into our `virtualbox` directory:

```shell
$ git clone https://github.com/cloudfoundry/bosh-deployment.git
```

Now we have all of the pieces in place to create our director. The `create-env` command is how we bootstrap the director, and we provide several options for customizing it to the VirtualBox running on our local system. For now, do not worry about trying to understand every option we're passing it - we'll get into them more later.

```shell
$ bosh create-env bosh-deployment/bosh.yml \
  --state state.json \
  --ops-file bosh-deployment/virtualbox/cpi.yml \
  --ops-file bosh-deployment/virtualbox/outbound-network.yml \
  --ops-file bosh-deployment/bosh-lite.yml \
  --ops-file bosh-deployment/bosh-lite-runc.yml \
  --ops-file bosh-deployment/jumpbox-user.yml \
  --vars-store creds.yml \
  --var director_name=bosh-lite \
  --var internal_ip=192.168.50.6 \
  --var internal_gw=192.168.50.1 \
  --var internal_cidr=192.168.50.0/24 \
  --var outbound_network_name=NatNetwork
```

!!! note
    This command will automatically create and enable a Host-only network for `192.168.50.0/24` ([details](https://github.com/cppforlife/bosh-virtualbox-cpi-release/blob/master/docs/networks-host-only.md)) and NAT network `NatNetwork` with DHCP enabled ([details](https://github.com/cppforlife/bosh-virtualbox-cpi-release/blob/master/docs/networks-nat-network.md)). In most environments you should not need to change this.

It will take a few minutes to download the dependencies, start a virtual machine, and install the director runtime; but, eventually, you should see it finish with a `Succeeded` message.

!!! tip
    The `creds.yml` file has dynamically-generated secrets and credentials you will need to connect to the director. Keep this file safe and we will come back to use it soon.

In later guides, we will be having the director create some VMs (technically, containers in the VirtualBox Director virtual machine). To make sure we will be able to connect to those VMs later, let's go ahead and add a network route to make sure those VMs will be accessible from our local system:

| System  | Command                                            |
| ------- | -------------------------------------------------- |
| macOS   | `sudo route add -net 10.244.0.0/16 192.168.50.6`   |
| Linux   | `sudo ip route add 10.244.0.0/16 via 192.168.50.6` |
| Windows | `route add 10.244.0.0/16 192.168.50.6`             |

!!! tip
    These network rules will be lost when your system is restarted. You may want to save the command to a `add-routes` script so it is easy to run again.

Congratulations - at this point you have a running director! Next, let's take a look at how to connect to the director...

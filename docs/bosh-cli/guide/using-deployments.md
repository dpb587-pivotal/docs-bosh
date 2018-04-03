# Creating a Deployment

A deployment is a collection of VMs, built from a [stemcell](stemcell.md), that has been populated with specific [releases](release.md) and disks that keep persistent data. These resources are created in the IaaS based on a deployment manifest and managed by the [Director](terminology.md#director), a centralized management server. TODO rewrite


## Deployment Manifest

Now that we have all our dependencies, we can create a deployment manifest to represent how we want our software to run. We will get into more detail about the semantics of the manifest, but here is a commented manifest we can get started with. Save this to a file called `zookeeper.yml`.

```yaml
name: zookeeper

releases:
# use the latest version of zookeeper that director has
- name: zookeeper
  version: latest

stemcells:
# use the ubuntu-trusty stemcell we already uploaded
- alias: default
  os: ubuntu-trusty
  version: latest

instance_groups:
# an instance group represents a set of software and configuration
- name: zookeeper
  # we want to have 3 instances (vms) running this configuration
  instances: 3
  # we will balance our instances across multiple azs
  azs: [z1, z2, z3]
  # jobs here refers to software from one of the releases
  jobs:
  # this is how zookeeper ends up running
  - name: zookeeper
    release: zookeeper
  # we need to store data, so we use a "persisten disk"
  persistent_disk: 1024
  # some defaults we can ignore for now
  vm_type: default
  stemcell: default
  networks:
  - name: default

# some settings to control update methodology
update:
  canaries: 2
  max_in_flight: 1
  canary_watch_time: 5000-60000
  update_watch_time: 5000-60000
```


## Running `deploy`

After saving the manifest to `zookeeper.yml`, we can use the `deploy` command to tell Director to make sure the deployment is provisioned to our desired state. The CLI will provide you with a diff before asking for confirmation for the change.

```shell
$ bosh -e virtualbox -d zookeeper deploy zookeeper.yml
```

!!! note
    When working with deployment-related commands such as `deploy`, we use the `-d` option to specify the name of the deployment that we want to work with.

After a couple moments of compiling, starting VMs, and installing software, you should see it finish successfully. You now have a ZooKeeper cluster running!


## Checking the Cluster

In theory, we have a ZooKeeper cluster running, at least. Let's take a little closer look to make sure. We can use the `vms` command to see a list of the virtual machines running for our deployment (your output should look similar):

```shell
$ bosh -e virtualbox -d zookeeper vms
Instance                                        Process State  AZ  IPs         VM CID                                VM Type  Active  
zookeeper/377ffe5e-b5a5-4360-8294-bf52d2ee31d0  running        z2  10.244.0.3  10349f49-f19b-4fdc-437e-afa9b49bcdf1  default  -  
zookeeper/5a285382-f16a-4fd8-a5e3-0c0b6081d560  running        z3  10.244.0.4  68dce0f0-8be0-4c35-507a-930c3e47f4e2  default  -  
zookeeper/7698e38c-296f-4147-a212-143a90ea23ee  running        z1  10.244.0.2  e511526f-30b4-4f1e-7f80-3751ee5473da  default  -  
```

Now that we know the IPs, let's try sending a message to one of the ZooKeeper endpoints to see if it really is running:

```shell
$ echo stat | nc 10.244.0.3 2181 | head -n1
Zookeeper version: 3.4.10-39d3a4f269333c922ed3db283be479f9deacaa0f, built on 03/23/2017 10:13 GMT
```

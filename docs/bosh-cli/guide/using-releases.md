# Using Releases

## About Releases

A release is a versioned collection of software which can be deployed anywhere with BOSH. It encapsulates configurable properties, configuration files, lifecycle concerns, and dependencies which are necessary for operations. BOSH releases are designed to help solve the following problems:

 * capturing all needed configuration options and scripts for deployment of the software;
 * recording all dependencies for the software;
 * versioning of software releases over time;
 * deploying software in an IaaS-agnostic and/or OS-agnostic way;
 * deploying software in environments without internet access.


## Finding Releases

You can find a list of official and community-maintained releases by visiting [bosh.io/releases](https://bosh.io/releases). It is not an exclusive list, so if there is a software you are interested in you may be able to find it with a Google or GitHub search if you also reference "bosh release".

For the purposes of these guides, we'll be working with [Apache ZooKeeper](https://zookeeper.apache.org/) - a popular server used for highly reliable, distributed coordination. It's okay if you are not familiar with ZooKeeper itself - we are more interested in the BOSH management side of things.


## Uploading a Release

Before we can deploy anything, we need to give Director the release which contains the software. One of the most common methods to do that is with the `upload-release` command. Here we can upload the [`zookeeper-release`](http://bosh.io/releases/github.com/cppforlife/zookeeper-release) from bosh.io:

```shell
$ bosh -e virtualbox upload-release \
  https://bosh.io/d/github.com/cppforlife/zookeeper-release?v=0.0.7 \
  --sha1 a863ef216ea75d22950703a3c924959cb20e59ba
```

!!! info
    Since releases include all of the dependencies the software needs to run, they can range in size from kilobytes to gigabytes. This `zookeeper-release` is a couple hundred megabytes and may take a few minutes to download.


## Listing Releases

Similarly to listing stemcells, we can use the `releases` command to see what releases are available on the Director:

```shell
$ bosh -e virtualbox releases
Name       Version  Commit Hash  
zookeeper  0.0.7    e7ead22  
```

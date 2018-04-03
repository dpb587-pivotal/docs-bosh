The `spec` file is YAML configuration which helps describe how a job is configured, the services it provides, and the dependencies it needs.

## Schema

### **`name`**

*Required*. This is the name of the job. It must match the job's directory name.


### **`description`**

A brief, human-friendly description of the job.


### **`templates`**

A hash describing the template files from the `templates` directory and the relative path where they will be installed. There are two conventional installation directories that we recommend:

 * `bin/*` - when files are installed into the `bin` directory, they will automatically be marked as executable.
 * `config/*` - a popular directory where releases install their configuration files.


### **`packages`**

A list of packages which this job relies on during runtime.


### **`properties`**

A hash of property names (key) and property metadata (value) which describe how the job can be configured by users of the release. For more details about properties and how to use them, see [Properties](../../../properties.md).

The schema for the property metadata looks like:

> #### **`description`**
>
> *Required*. A description of the configuration property to help a user understand where to get the value or how it may be used.
>
>
> #### **`example`**
>
> An example of a value that the user might configure the property with. This is particularly useful to show how non-simple value types may be represented.
>
>
> #### **`default`**
>
> A default value for the property if the user does not specify one.


### **`provides`**

TODO

### **`consumes`**

TODO


## Examples

### HTTP Server

A simple job called `http-server` which relies on a single package (which also happens to be named `http-server`) and has a single property to configure its port.

```yaml
name: http-server
description: |
  The http-server job runs a simple HTTP server.

templates:
  ctl.sh: bin/ctl
  config.json: config/config.json

packages:
- http-server

properties:
  port:
    description: "Port to listen on"
    default: 8080
```


### Real-world

 * [os-conf/ca_certs](https://github.com/cloudfoundry/os-conf-release/blob/22510c5582adb5d2c23e95ebd2b56ec24bb1141a/jobs/ca_certs/spec)
 * [postgres/postgres](https://github.com/cloudfoundry/postgres-release/blob/64248bfdecb2d2d0e357c845cd2f7cf9335f38ca/jobs/postgres/spec)
 * [diego/auctioneer](https://github.com/cloudfoundry/diego-release/blob/3855cb32ba50f30901277c8b4fd4eff6d6b45983/jobs/auctioneer/spec)

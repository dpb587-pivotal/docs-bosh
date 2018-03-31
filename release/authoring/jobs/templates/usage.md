Template files are evaluated with [ERB](http://apidock.com/ruby/ERB) whenever a release is being deployed.


## Basic Syntax

If you are not familiar with ERB, it uses opening and closing tags to dynamically replace content.

To evaluate Ruby code, for example to set a variable or to use blocks like `if`/`end`, use `<% ... %>`:

```erb
<% math = 4 * 8 + 15 %>
```

To render something for the file output, use `<%= ... %>`:

```erb
<%= math %>
```

If you want to leave an unparsed comment, use `<%# ... %>`:

```erb
<%# math is hard %>
```


## Helper Methods

BOSH provides several helper methods for accessing information about the job.


### Properties

Any property which has been defined in the job's [`spec` file](../spec.md) can be accessed in templates. When using these methods, if a user has not specifically set the value, it will use whatever property `default` was defined.


#### `p(property)`

The `p` methods perform a value lookup for a given property. If the property does not have a `default` configured in the `spec` file, an error will be raised.

```erb
<%= p('some.property') %>
```


#### `p(property, local_default)`

Similar to `p(property)`, but if the user did not configure the property, `local_default` will be used. In this case, `local_default` takes precedence to any `default` which may have been defined in the `spec` file.

```erb
<%= p('some.property', 'my default') %>
```


#### `p(properties)`

Similar to `p(property)`, but you can specify a list of properties to lookup. The first property which was configured by the user will be returned. If no property was configured by the user, an error will be raised.

```erb
<%= p(['first', 'second', 'third']) %>
```


#### `p(properties, local_default)`

Similar to `p(properties)` the first property which has been configured by the user will be returned. If no property was configured, `local_default` will be used.

```erb
<%= p(['first', 'second'], 'default third') %>
```


#### `if_p(property...) do`


### Links


## `spec` Object

Templates have access to a special `spec` object which contains instance-specific configuration. The following properties are available:


### **`address`**

Default network address (IPv4, IPv6 or DNS record) for the instance. Introduced in (v255.4](todo.md).


### **`az`**

Availability zone of the instance. This property is empty if you are not using [cloud config](../../../../todo.md).


### **`bootstrap`**

True if this instance is the first instance of its group (learn more about the [bootstrap instance](../../../../todo.md)).


### **`deployment`**

The name of the BOSH deployment containing this instance.


### **`id`**

A UUID for the instance.


### **`index`**

A numeric index for the instance.

!!! warning
    Indices of instances may not be numbered consecutively, and there may be gaps between indices. We recommend using `id` for most cases, or `bootstrap` if you are trying to have single, bootstrap logic.


### **`ip`**

IP address of the instance. When an instance has multiple IP addresses, the IP of the [addressable or default network](../../../../networks.md#multi-homed) is used. Introduced in [v258](../../../../todo.md).


### **`name`**

The instance group name.


### **`networks`***

Entire set of network information for the instance.

TODO explain network hash


## Examples

TODO example templates

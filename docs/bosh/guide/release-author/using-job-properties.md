## Step 5: Create Job Properties  ## <a id="create-props"></a>

If your service needs to be configurable at deployment time,
you create the desired inputs or controls and specify them in the release.
Each input is a _property_ that belongs to a particular job.

Creating properties requires three steps:

1. Define properties and defaults in the `properties` block of
the job spec.

1. Use the property lookup helper `p()` to reference properties in
relevant templates.

For example, a start command can take a property as an argument,
using the property lookup helper:

       <%= p('<job_name>.<property_name>') %>

1. Specify the property in the [deployment manifest](./manifest-v2.html#instance-groups).

Adapt the example below to create any properties your release needs now.

In our example, we want the port that the web UI listens on to be a
configurable property.

We edit the spec for the web UI job to look like this:

```yaml
properties:
   port:
     description: Port that web_ui app listens on
     default: 80
```

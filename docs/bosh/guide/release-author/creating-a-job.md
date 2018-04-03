# Creating a New Job

In order for a release to run or do something, we need to create a "job". The job, along with its dependencies, is what will end up being installed on a virtual machine. For this example, we will create a job that can run a very simple TCP server.


## Generate a Job

To create a new job, we can use the `generate-job` command to initialize the job files we will need:

```shell
$ bosh generate-job nc-server
```

If you look at the new `jobs/nc-server` directory, you'll see:

 * `monit` - a file used for process management
 * `spec` - a file to describe the job and how it runs
 * `templates` - a directory where we can put files that will be installed onto the vm


## Create a Run Script

For our simple TCP server, we are going to run `nc` and make sure it says `Hello World` to anything which connects to it. Let's use the following command and save it to the file `jobs/nc-server/templates/run.erb`:

```shell
while :; do echo "Hello World" | nc -l -p 8002 ; done
```

---
---

### Create control scripts  ### <a id="control"></a>

Every job needs a way to start and stop.
You provide that by writing a control script and updating the `monit` file.

The control script:

* Includes a start command and a stop command.
* Is an ERB template stored in the `templates` directory for the relevant job.

For each job, create a control script that configures the job to store logs in `/var/vcap/sys/log/JOB_NAME`. Save this script as `ctl.erb` in the `templates` directory for its job.

The control script for the `web_ui` job looks like this:

```bash
#!/bin/bash

RUN_DIR=/var/vcap/sys/run/web_ui
LOG_DIR=/var/vcap/sys/log/web_ui
PIDFILE=${RUN_DIR}/pid

case $1 in

  start)
    mkdir -p $RUN_DIR $LOG_DIR
    chown -R vcap:vcap $RUN_DIR $LOG_DIR

    echo $$ > $PIDFILE

    cd /var/vcap/packages/ardo_app

    export PATH=/var/vcap/packages/ruby_1.9.3/bin:$PATH

    exec /var/vcap/packages/ruby_1.9.3/bin/bundle exec \
      rackup -p <%= properties.web_ui.port %> \
      >>  $LOG_DIR/web_ui.stdout.log \
      2>> $LOG_DIR/web_ui.stderr.log

    ;;

  stop)
    kill -9 `cat $PIDFILE`
    rm -f $PIDFILE

    ;;

  *)
    echo "Usage: ctl {start|stop}" ;;

esac
```

If your release needs templates other than the control script, create them now.

### Update monit files  ### <a id="monit"></a>

The `monit` file:

* Specifies the process ID (pid) file for the job
* References each command provided by the templates for the job
* Specifies that the job belongs to the `vcap` group

On a deployed release, a BOSH Agent runs on each job VM.
BOSH communicates with the Agent, which in turn executes commands in the
control script.
The Agent does this using open source process monitoring software called
[Monit](http://mmonit.com/monit/).

The `monit` file for the `web_ui` job looks like this:

```
check process web_ui
  with pidfile /var/vcap/sys/run/web_ui/pid
  start program "/var/vcap/jobs/web_ui/bin/ctl start"
  stop program "/var/vcap/jobs/web_ui/bin/ctl stop"
  group vcap
```

Update the `monit` file for each of your jobs.
Use `/var/vcap` paths as shown in the example.

<p class="note"><strong>Note</strong>: BOSH requires a <code>monit</code> file for each job in a release. When developing a release, you can use an empty <code>monit</code> file to meet this requirement without having to first create a control script.</p>

### Update job specs  ### <a id="job-specs"></a>

At compile time, BOSH transforms templates into files, which it then replicates
on the job VMs.

The template names and file paths are among the metadata for each job that
resides in the job `spec` file.

In the job `spec` file, the `templates` block contains key/value pairs where:

* Each key is template name
* Each value is the path to the corresponding file on a job VM

The file paths that you provide for templates are relative to
the `/var/vcap/jobs/<job_name>` directory on the VM.
For example, `bin/ctl` becomes `/var/vcap/jobs/<job_name>/bin/ctl` on the job VM.
Using `bin` as the directory where these files go is a convention.

The `templates` block of the updated `spec` files for the example jobs look
like this:

```yaml
templates:
  ctl.erb: bin/ctl
```

For each job, update the `spec` file with template names.

### Commit ### <a id="commit-one"></a>

You have now created one or more job skeletons; this is a good time to commit.

If you used the `--git` option with `bosh init-release` (as recommended), the
correct `.gitignore` file has been automatically created for you.

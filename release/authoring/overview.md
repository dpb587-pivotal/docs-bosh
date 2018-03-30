A release is a collection of software which can be deployed anywhere with BOSH. It encapsulates configurable properties, configuration files, lifecycle concerns, and dependencies which are necessary for operations. BOSH releases are designed to help solve the following problems:

 * capturing all needed configuration options and scripts for deployment of the software;
 * recording all dependencies for the software;
 * versioning of software releases over time;
 * deploying software in an IaaS-agnostic and/or OS-agnostic way;
 * deploying software in environments without internet access.


## Core Concepts

There are a few concepts which are important in a BOSH release. We'll get into these in more detail, but, in summary, they are:

 * **[Jobs](../../../todo.md)** - a job represents a service which should be installed and running. Typically, it includes scripts for starting, monitoring, and stopping a long-running process to provide the service.
 * **[Packages](../../../todo.md)** - a package represents underlying software, libraries, binaries, and other blobs which are necessary for a job to run.
 * **[Blobs](../../../todo.md)** - to support package dependencies and ensure files are always available, blobs are used to track software, libraries, and binaries.
 * **[Blobstore](../../../todo.md)** - to avoid committing large files to a repository, a backend (like Amazon S3 or Google Cloud Storage) is used for storing blobs and other release artifacts over time.


## Structure

The directory structure of a release should look something like the following:

 * `blobs/` - a local copy of blobs
 * `config/` - configuration for the release
    * `blobs.yml` - metadata about blobs from the `blobs` directory
    * `final.yml` - configuration describing the release and its data
 * `jobs/` - jobs and their files
 * `packages/` - packages and their files
 * `src/` - source code or submodules
 * `LICENSE` - a license for the release
 * `README` - human-friendly readme about the release

Traditionally, every release is a git repository. This allows changes to be tracked over time and for releases to be maintained by a larger team.

!!! tip
    To automatically initialize a release and these files, use the [init-release](../../../todo.md) command.

    ```shell
    $ bosh init-release --dir=exemplar-release
    ```

!!! note
    To learn more about how repository workflows relate to release management, see [Creating Final Releases](../../../todo.md).

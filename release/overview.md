A release is a collection of software which can be deployed anywhere with BOSH. It encapsulates configurable properties, configuration files, lifecycle concerns, and dependencies which are necessary for operations. BOSH releases are designed to help solve the following problems:

 * capturing all needed configuration options and scripts for deployment of the software;
 * recording all dependencies for the software;
 * versioning of software releases over time;
 * deploying software in an IaaS-agnostic and/or OS-agnostic way;
 * deploying software in environments without internet access.

## Core Concepts

There are a couple concepts which are widely referenced in BOSH releases:

 * **[Jobs](../todo.md)** - a job represents a service which should be installed and running. Typically, it includes scripts for starting, monitoring, and stopping a long-running process to provide the service.
 * **[Packages](../todo.md)** - a package represents underlying software, libraries, binaries, and other blobs which are necessary for a job to run.

If you are authoring a release, you will also be interested in the following:

 * **[Blobs](../todo.md)** - to support package dependencies and ensure files are always available, blobs are used to track software, libraries, and binaries.
 * **[Blobstore](../todo.md)** - to avoid committing large files to a repository, a backend (like Amazon S3 or Google Cloud Storage) is used for storing blobs and other release artifacts over time.

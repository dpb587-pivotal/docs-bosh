If you are wanting to create or change a release, you will want to be a little more familiar with how releases work and what they look like.


## Core Concepts

There are a couple concepts which are widely referenced in BOSH releases:

 * **Jobs** - a job represents a service which should be installed and running. Typically, it includes scripts for starting, monitoring, and stopping a long-running process to provide the service.
 * **Packages** - a package represents underlying software, libraries, binaries, and other blobs which are necessary for a job to run.
 * **Blobs** - to support package dependencies and ensure files are always available, blobs are used to track software, libraries, and binaries.
 * **Blobstore** - to avoid committing large files to a repository, a backend (like Amazon S3 or Google Cloud Storage) is used for storing blobs and other release artifacts over time.


## Directory Structure

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

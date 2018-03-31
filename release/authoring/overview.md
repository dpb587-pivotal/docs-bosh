If you are wanting to create or change a release, you will want to be a little more familiar with how releases work and what they look like.


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

Traditionally, every release is a git repository. This allows changes to be tracked over time and for releases to be maintained by a larger team.

!!! tip
    To automatically initialize a release and these files, use the [init-release](../../todo.md) command.

    ```shell
    $ bosh init-release --dir=exemplar-release
    ```

!!! note
    To learn more about how repository workflows relate to release management, see [Creating Final Releases](../../todo.md).


When creating a release, you will likely use a source code repository.
But releases often use tar files or other binaries, also known as blobs.
Checking blobs into a repository is problematic if your repository
unsuited to dealing with large binaries (as is true of Git, for example).

BOSH lets you avoid checking blobs into a repository by doing the following:

* For dev releases, use local copies of blobs.

* For a final release, upload blobs to a blobstore, and direct BOSH to obtain the blobs from there.

### Configure a blobstore  ### <a id="config-blobstore"></a>

In the `config` directory, you record the information BOSH needs about the
blobstore:

* The `final.yml` file names the blobstore and declares its type, which is either `local`
or one of several other types that specify blobstore providers.

* The `private.yml` file specifies the blobstore path, along with a secret.

`private.yml` contains keys for accessing the blobstore and should not be
checked into a repository.
(If you used the `--git` option when running `bosh init-release` at the beginning
of this tutorial, `private.yml` is automatically `gitignored`.)

The `config` directory also contains two files whose content is automatically
generated: the `blobs.yml` file and the `dev.yml` file.

Adapt the examples below to fit the specifics of your release.
Our example release uses the `local` type blobstore because otherwise it would
be necessary to explain how to configure a public blobstore such as
Amazon S3, which is too large a topic for this context.

The `local` type blobstore is suitable for learning but the resulting release
cannot be shared.
For that reason, you should configure a non-local, publicly available blobstore
for releases that you intend to share.
Normally, the blobstore you choose when you begin working on a release is used
for all subsequent versions of the release.
Changing the blobstore that a release uses is beyond the scope of this tutorial.

Example `final.yml`:

```yaml
---
blobstore:
  provider: local
  options:
    blobstore_path: /tmp/ardo-blobs
final_name: ardo_app
```

Example `private.yml`:

```yaml
---
blobstore_secret: 'does-not-matter'
blobstore:
  local:
    blobstore_path: /tmp/ardo-blobs

```

If you have a `private.yml` file:

* **Required**: Include the `blobstore_path` in the `private.yml` file.
* **Optional**: Include the `blobstore_path` in the `final.yml` file. Doing so allows you to `gitignore` the `private.yml` file but still allow the release to be downloaded and used on other systems.

<p class="note"><strong>Note</strong>: The <code>blobstore_secret</code> is required for the <code>local</code> type blobstore.
This is true even though the <code>blobstore_secret</code> line is deprecated and its
content does not matter.
There is never a <code>blobstore_secret</code> line for blobstores of types other than
<code>local</code>.</p>

### Inform BOSH where blobs are ### <a id="inform"></a>

In the package `spec` file, the `files` block lists any binaries you downloaded,
along with the URLs from which you downloaded them.
(This assumes that you followed the directions in the [Update package specs](#update-pkging-specs) section.)

Those files are blobs, and now you need the paths to the downloaded blobs on
your local system.

In our example, the `spec` file for the `libyaml_0.1.4` package includes the line:

```yaml
files:
- libyaml_0.1.4/yaml-0.1.4.tar.gz # From http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz
```

If you downloaded the blob, its local path might be:

`~/Downloads/yaml-0.1.4.tar.gz`

Go through all your packages and make a list of local paths to the blobs you downloaded.
Now you are ready to inform BOSH about these blobs.

For each blob, run:

`bosh add-blob <path_to_blob_on_local_system> <package_name>`

e.g.

`bosh add-blob ~/Downloads/yaml-0.1.4.tar.gz libyaml_0.1.4`

The `bosh add-blob` command adds a local blob to the collection your release
recognizes as BOSH blobs.

The usage shown above is a blend of requirement and convention.
It works like this:

* For the first argument, you provide the path to the blob on your local system
* For the second argument, you provide a destination within the `blobs` directory
in your release
* BOSH goes into the `blobs` directory and creates a subdirectory with
the name of the package that the local blob represents
* In the new subdirectory, BOSH creates a symbolic link to a copy of the blob
which BOSH makes in a hidden directory

Using the package name as the second argument of the `bosh add-blob` command
is recommended because it produces a cleanly-organized blobs directory.

Later, when you upload blobs for a final release, BOSH uses the hidden directory
as a staging area.

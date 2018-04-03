All the elements needed to create a dev release should now be in place.

### Release  ### <a id="dev-release-release"></a>

For the dev release, use the `--force` option with the `bosh create-release`
command.
This forces BOSH to use the local copies of our blobs.

Without the `--force` option, BOSH requires blobs to be uploaded before you
run `bosh create-release`.
For a final release, we upload blobs, but not for a dev release.

Create the dev release:

`bosh create-release --force`

BOSH prompts for a release name, and assigns a dot-number version to the release.

### Deploy the Dev Release  ### <a id="dev-release-deploy"></a>

Deploying the release requires three or more steps, depending on whether
BOSH is targeting the desired Director, and whether BOSH is already pointing
to a release.

See what director BOSH is targeting:

  `bosh env`

Target a director:

  `bosh -e <director_alias> log-in`

See what releases are available:

  `bosh releases`

If BOSH is already pointing to a release, edit the BOSH deployment manifest.
Otherwise, create a manifest. See [BOSH Deployment Manifest](./deployment-manifest.html) for more information.
Simple manifest for `ardo_app` can be found [here](https://gist.github.com/antonsoroko/3be4c70b38f846b1d79eca7192a5ab58) (OpenStack) or [here](https://gist.github.com/uzzz/9ad9cad105032fecdbeb223798607a87) (AWS).

Upload the new dev release.

   `bosh upload-release`

Assuming you are in the release directory, no path is needed with the above command.

Deploy:

   `bosh deploy`

### Test the Dev Release  ### <a id="dev-release-test"></a>

What tests to run depends on the software you are releasing.

Start by opening a separate terminal, logging in on the job VM, and observing
logging output as you test your release.

If your release fails tests, follow this pattern.

* Fix the code.
* Do a new dev release.
* Run `bosh deploy` to see whether the new release deploys successfully.

Using `bosh deploy --recreate` can provide a clearer picture because with that option,
BOSH deploys all the VMs from scratch.

# Creating a Package

Packages give BOSH the information needed to prepare the binaries and
dependencies for your jobs.

Create package skeletons starting from the bottom of your dependency graph.

  `bosh generate-package <dependency_name>`

In our example, we run this command three times.
Starting from the bottom of the dependency graph,
we run it for `libyaml_0.1.4`, `ruby_1.9.3`, and `ardo_app`.

View the package skeletons with `tree`:

```shell
$ tree packages
packages
├── ardo_app
│   ├── packaging
│   ├── pre_packaging
│   └── spec
├── libyaml_0.1.4
│   ├── packaging
│   ├── pre_packaging
│   └── spec
└── ruby_1.9.3
    ├── packaging
    ├── pre_packaging
    └── spec

3 directories, 9 files
```

Putting each dependency in a separate package provides maximum reusability
along with a clear, modular structure. This is not mandatory; what packages
to create is a matter of preference. You could even opt to put all the
dependencies together in a single package, though that is not recommended.

<p class="note"><strong>Note</strong>: Use of the <code>pre_packaging</code> file is not recommended, and is not discussed in this tutorial.</p>

Without using `pre_packaging` for our `ardo_app` we need to pack gems manually for further usage:

```shell
$ cd src/ardo_app/
$ bundle package
```

### Update packaging specs ### <a id="update-pkging-specs"></a>

Within each package directory, there is a `spec` file which states:

* The package name
* The package's dependencies
* The location where BOSH can find the binaries and other files that the package needs at compile time

Use your dependency graph to determine which dependencies belong in each spec.
Developer preferences and style play a role here.
Consider our example: the spec for Ruby lists `rubygems` and `bundler` as dependencies along
with Ruby itself.
Some Ruby developers would do it this way; others would not.

To maximize portability of your release across different versions of stemcells,
never depend on the presence of libraries or other software on stemcells.

To describe binary locations in the `files` block of the spec:

* Find the official site for the binary in question.
For example, Ruby might be at `http://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p484.tar.gz`.

* Download the binary from the official location and make sure the file hash matches.

* Record the binary name including version number, with a slash and the binary
filename concatenated to it.
It's a good idea to cite the official URL in a comment, in the same line.

BOSH interprets the locations you record in the `files` section as being
either in the `src` directory or in the `blobs` directory.
(BOSH looks in `src` first.)
When you add the actual blobs to a blobstore (see the next section),
BOSH populates the `blobs` directory with the correct information.

For packages that depend on their own source code, use the globbing pattern
`<package_name>/**/*` to deep-traverse the directory in `src` where
the source code should reside.

Update the spec for each package.
Refer to the example specs below for guidance.

#### Example libyaml package spec #### <a id="pkg-spec-libyaml"></a>

```yaml
---
name: libyaml_0.1.4

dependencies: []

files:
- libyaml_0.1.4/yaml-0.1.4.tar.gz # From http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz
```

#### Example Ruby package spec #### <a id="pkg-spec-ruby"></a>

```yaml
---
name: ruby_1.9.3

dependencies:
- libyaml_0.1.4

files:
- ruby_1.9.3/ruby-1.9.3-p484.tar.gz # http://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p484.tar.gz
- ruby_1.9.3/rubygems-1.8.24.tgz    # http://production.cf.rubygems.org/rubygems/rubygems-1.8.24.tgz
- ruby_1.9.3/bundler-1.2.1.gem      # https://rubygems.org/downloads/bundler-1.2.1.gem
```

#### Example ardo_app package spec #### <a id="pkg-spec-ardo"></a>

```yaml
---
name: ardo_app

dependencies:
- ruby_1.9.3

files:
- ardo_app/**/*
```

### Create packaging scripts ### <a id="pkg-scripts"></a>

At compile time, BOSH takes the source files referenced in the package specs,
 and renders them into the executable binaries and scripts that your deployed
jobs need.

You write packaging scripts to instruct BOSH how to do this.
The instructions may involve some combination of copying, compilation, and
related procedures.
For example:

* For a Ruby app like `ardo_app`, BOSH must copy source files and install Ruby
gems.

* For Ruby itself, BOSH must compile source code into a binary.

* For a Python app, BOSH must copy source files and install Python eggs.

BOSH relies on you to write packaging scripts that perform the correct operation.

Adhere to these principles when writing packaging scripts:

* Use your dependency graph to determine which dependencies belong in each
packaging script.

* Begin each script with a `set -e -x` line.
This aids debugging at compile time by causing the script to exit immediately
if a command exits with a non-zero exit code.

* Ensure that any copying, installing or compiling delivers resulting code to
 the install target directory (represented as the `BOSH_INSTALL_TARGET`
environment variable). For `make` commands, use `configure` or its equivalent
to accomplish this.

* Be aware that BOSH ensures that dependencies cited in the `dependencies`
block of package `spec` files are available to the deployed binary.
For example, in the `spec` file for the Ruby package, we cite libyaml as a
dependency.
This ensures that on the compilation VMs, the packaging script for Ruby has
access to the compiled libyaml package.

If the instructions you provide in the packaging scripts fail to deliver compiled
code to `BOSH_INSTALL_TARGET`, the job cannot function because the VM has no
way to find the code to run.
This failure scenario can happen if, for example,
you use a `make` command that delivers compiled code to some standard location
by default.
You can fix the problem by configuring `make` to compile into
`BOSH_INSTALL_TARGET`.
See how this is done in the example packaging scripts.

Like control scripts, writing packaging scripts is one of the heavier tasks
entailed in creating a release.
Write your packaging scripts now.
Refer to the examples below for guidance.

#### Example libyaml packaging script #### <a id="pkg-script-libyaml"></a>

```
set -e -x

tar xzf libyaml_0.1.4/yaml-0.1.4.tar.gz
pushd yaml-0.1.4
  ./configure --prefix=${BOSH_INSTALL_TARGET}

  make
  make install
popd
```

#### Example Ruby packaging script #### <a id="pkg-script-ruby"></a>

```
set -e -x

tar xzf ruby_1.9.3/ruby-1.9.3-p484.tar.gz
pushd ruby-1.9.3-p484
  ./configure \
    --prefix=${BOSH_INSTALL_TARGET} \
    --disable-install-doc \
    --with-opt-dir=/var/vcap/packages/libyaml_0.1.4

  make
  make install
popd

tar zxvf ruby_1.9.3/rubygems-1.8.24.tgz
pushd rubygems-1.8.24
  ${BOSH_INSTALL_TARGET}/bin/ruby setup.rb
popd

${BOSH_INSTALL_TARGET}/bin/gem install ruby_1.9.3/bundler-1.2.1.gem --no-ri --no-rdoc
```

#### Example ardo_app packaging script #### <a id="pkg-script-ardo"></a>

```
set -e -x

cp -a ardo_app/* ${BOSH_INSTALL_TARGET}

cd ${BOSH_INSTALL_TARGET}

/var/vcap/packages/ruby_1.9.3/bin/bundle install \
  --local \
  --deployment \
  --without development test
```

### Update job specs with dependencies ### <a id="update-job-specs-with-deps"></a>

The dependency graph reveals runtime dependencies that
need to be added to the `packages` block of the job spec.

Edit the job specs to include these dependencies.

In our example, the dependency graph shows that `web_ui` job depends on
`ardo_app` and `ruby_1.9.3`:

```yaml
packages:
- ardo_app
- ruby_1.9.3
```

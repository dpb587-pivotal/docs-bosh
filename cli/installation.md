Depending on your environment, you have a few options for installing the BOSH CLI.

!!! tip
    If you will be using the `create-env` or `delete-env` commands, be sure to review the [Additional Requirements](#additional-requirements) section below once you install the CLI.


## Installation

Choose one of the installation methods below. Once installed, you should be able to verify the installed version:

```shell
$ bosh -v
version 3.0.1-712bfd7-2018-03-13T23:26:42Z

Succeeded
```


### Using curl

If you prefer to install by downloading the binary directly, choose the correct binary for your system:

| Download                                                                                                         | Checksum (SHA1)                                     |
| ---------------------------------------------------------------------------------------------------------------- | ------------------------------------------ |
| [bosh-cli-3.0.1-darwin-amd64](https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-3.0.1-darwin-amd64)           | `d2fea20210a47b8c8f1f7dbb27ffb5808d47ce87` |
| [bosh-cli-3.0.1-linux-amd64](https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-3.0.1-linux-amd64)             | `ccc893bab8b219e9e4a628ed044ebca6c6de9ca0` |
| [bosh-cli-3.0.1-windows-amd64.exe](https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-3.0.1-windows-amd64.exe) | `41c23c90cab9dc62fa0a1275dcaf64670579ed33` |

1. Download the binary:

    ```
    curl -LOo ./bosh https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-3.0.1-linux-amd64
    ```

1. Make the `bosh` binary executable:

    ```
    chmod +x ./bosh
    ```

1. Move the binary to your `PATH`:

    ```
    sudo mv ./bosh /usr/local/bin/bosh
    ```


### Using Homebrew on macOS

If you are on macOS and using [Homebrew](https://brew.sh/), you can use the [Cloud Foundry tap](https://github.com/cloudfoundry/homebrew-tap) to install `bosh`.

1. Use `brew` to install `bosh-cli`:

    ```
    brew install cloudfoundry/tap/bosh-cli
    ```


## Additional Requirements

If you are using the `create-env` and `delete-env` commands, there are additional dependencies you will need.


### CentOS

```shell
$ sudo yum install gcc gcc-c++ ruby ruby-devel mysql-devel postgresql-devel postgresql-libs sqlite-devel libxslt-devel libxml2-devel patch openssl
$ gem install yajl-ruby
```


### macOS

1. Install Apple Command Line Tools:

    ```shell
    $ xcode-select --install
    ```

2. Use [Homebrew](https://brew.sh/) to install OpenSSL:

    ```shell
    $ brew install openssl
    ```


### Ubuntu Trusty

```shell
$ sudo apt-get update
$ sudo apt-get install -y build-essential zlibc zlib1g-dev ruby ruby-dev openssl libxslt-dev libxml2-dev libssl-dev libreadline6 libreadline6-dev libyaml-dev libsqlite3-dev sqlite3
```

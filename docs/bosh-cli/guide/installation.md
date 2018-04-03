# Installing the BOSH CLI

The BOSH CLI (`bosh`) is the command line tool used for interacting with all things BOSH - whether it is deployment operations or software release management.

To get started, let's make sure we are installing the latest version of `bosh`. Choose your preferred installation method below...


### Using curl

To install the `bosh` binary directly, choose the correct download for your system:

| System         | Download                                                                                                         | Checksum (SHA1)                                     |
| -------------- | ---------------------------------------------------------------------------------------------------------------- | ------------------------------------------ |
| Darwin / macOS | [bosh-cli-3.0.1-darwin-amd64](https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-3.0.1-darwin-amd64)           | `d2fea20210a47b8c8f1f7dbb27ffb5808d47ce87` |
| Linux          | [bosh-cli-3.0.1-linux-amd64](https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-3.0.1-linux-amd64)             | `ccc893bab8b219e9e4a628ed044ebca6c6de9ca0` |
| Windows        | [bosh-cli-3.0.1-windows-amd64.exe](https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-3.0.1-windows-amd64.exe) | `41c23c90cab9dc62fa0a1275dcaf64670579ed33` |

1. Download the binary (this example is using Linux):

    ```shell
    curl -LOo ./bosh https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-3.0.1-linux-amd64
    ```

1. Make the `bosh` binary executable:

    ```shell
    chmod +x ./bosh
    ```

1. Move the binary to your `PATH`:

    ```shell
    sudo mv ./bosh /usr/local/bin/bosh
    ```

1. Verify that `bosh -v` shows the installed version and a `Succeeded` message:

    ```shell
    $ bosh -v
    version 3.0.1-712bfd7-2018-03-13T23:26:42Z

    Succeeded
    ```

### Using Homebrew on macOS

If you are on macOS with [Homebrew](https://brew.sh/), you can install using the [Cloud Foundry tap](https://github.com/cloudfoundry/homebrew-tap).

1. Use `brew` to install `bosh-cli`:

    ```shell
    brew install cloudfoundry/tap/bosh-cli
    ```

1. Verify that `bosh -v` shows the installed version and a `Succeeded` message:

    ```shell
    $ bosh -v
    version 3.0.1-712bfd7-2018-03-13T23:26:42Z

    Succeeded
    ```

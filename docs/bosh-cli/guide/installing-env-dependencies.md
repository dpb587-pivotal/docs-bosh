# Installing Additional CLI Dependencies

When you are using `bosh` to bootstrap BOSH or other standalone VMs, you will need a few extra dependencies installed on your local system. These dependencies will ensure `bosh` can compile bootstrapping packages and correctly render the configuration files it needs.

!!! tip
    If you will not be using `create-env` and `delete-env` commands, you can skip these steps.


## Ubuntu Trusty

If you are running on Ubuntu Trusty, ensure the following packages are installed on your system:

```shell
sudo apt-get install -y build-essential zlibc zlib1g-dev ruby ruby-dev openssl libxslt-dev libxml2-dev libssl-dev libreadline6 libreadline6-dev libyaml-dev libsqlite3-dev sqlite3
```


## macOS

If you are running on macOS, take the following two steps to ensure `bosh` will be able to compile packages and correctly link to `openssl`.

1. Install the [Apple Command Line Tools](https://developer.apple.com/download/more/):

    ```shell
    xcode-select --install
    ```

2. Use [Homebrew](https://brew.sh/) to additionally install OpenSSL:

    ```shell
    brew install openssl
    ```


## CentOS

If you are running on CentOS, ensure the following packages are installed on your system:

```shell
$ sudo yum install gcc gcc-c++ ruby ruby-devel mysql-devel postgresql-devel postgresql-libs sqlite-devel libxslt-devel libxml2-devel patch openssl
$ gem install yajl-ruby
```


## Windows

The `create-env` and `destroy-env` commands are not yet supported on Windows. Feel free to give it a try (and let us know if you have feedback), but we would recommend using a Linux-based virtual machine to run those commands instead.


## Other

You should be able to use `bosh` on other systems... we just don't know the exact packages to recommend. In general, use these recommendations (and send us a pull request to update this page once you figure it out!):

 * compilation tools (often a `build-essential`-like package or "Development Tools"-like group)
 * Ruby v2.4+

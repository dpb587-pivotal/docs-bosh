#!/bin/bash

rm -fr docs/bosh-cli/reference/command
mkdir -p docs/bosh-cli/reference/command

for cmd in $( GO_FLAGS_COMPLETION=1 bosh '' ); do
  echo docs/bosh-cli/reference/command/$cmd.md

  (
    echo '# `bosh ' $cmd '`'
    echo
    bosh $cmd $subcmd --help | sed 's/^/    /'
  ) > docs/bosh-cli/reference/command/$cmd.md
done

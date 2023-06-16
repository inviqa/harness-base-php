#!/bin/bash

function task_wp-cli_install()
{
  if [ ! -f bin/wp-cli.phar ]; then
    mkdir -p bin
    curl --fail --silent --show-error --location --output bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x bin/wp-cli.phar
  fi
}

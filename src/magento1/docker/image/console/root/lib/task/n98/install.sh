#!/bin/bash

function task_n98_install()
{
  if [ ! -f bin/n98-magerun.phar ]; then
    mkdir -p bin
    curl --fail --silent --show-error --location --output bin/n98-magerun.phar https://files.magerun.net/n98-magerun.phar
    chmod +x bin/n98-magerun.phar
  fi
}

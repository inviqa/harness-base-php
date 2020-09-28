#!/bin/bash

set -e
set -x

./build
mkdir tests
cd tests
ws create magento2-test inviqa/magento2 --no-install
cp -pR ../dist/harness-magento2/ magento2-test/.my127ws/
cd magento2-test
echo "attribute('mutagen'): no" >> workspace.override.yml

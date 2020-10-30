#!/bin/bash

set -e -o pipefail

if [ -z "$BUILD_ID" ]; then
  echo "Skipping as not in Jenkins"
  exit 1
fi

echo "Checking running containers:"
if docker ps | grep -v my127ws | grep -v quay.io/inviqa_images/workspace | grep -v CONTAINER | grep '^.*$'; then
  echo "Stopping containers:"
  docker ps | grep -v my127ws | grep -v quay.io/inviqa_images/workspace | grep -v CONTAINER | cut -d" " -f1 | xargs --no-run-if-empty docker kill
else
  echo -n "No extra containers"
fi
echo
echo "Checking stopped containers:"
if docker ps -a | grep -v my127ws | grep -v quay.io/inviqa_images/workspace | grep -v CONTAINER | grep '^.*$'; then
  echo "Deleting containers:"
  docker ps -a | grep -v my127ws | grep -v quay.io/inviqa_images/workspace | grep -v CONTAINER | cut -d" " -f1 | xargs --no-run-if-empty docker rm -f -v
else
  echo -n "No extra containers"
fi
echo

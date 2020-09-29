#!/bin/bash

if [ -z "$BUILD_ID" ]; then
  echo "Skipping as not in Jenkins"
  exit 1
fi

if docker ps | grep -v my127ws | grep -v CONTAINER | grep '^.*$'; then
  docker ps | grep -v my127ws | grep -v CONTAINER | cut -d" " -f1 | xargs --no-run-if-empty docker kill
fi
if docker ps -a | grep -v my127ws | grep -v CONTAINER | grep '^.*$'; then
  docker ps -a | grep -v my127ws | grep -v CONTAINER | cut -d" " -f1 | xargs --no-run-if-empty docker rm -f -v
fi

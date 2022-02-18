#!/bin/bash

set -o errexit

if ! [ -e symfony.lock ]; then
    # ensure a full build is done dynamically to get all repo artifacts
    export MY127WS_ENV=local # static tests switch to pipeline
    ws harness prepare
    ws enable console
    ws destroy
fi 

ws set app.build 'static'

#!/bin/bash

set -o errexit

if ! [ -e symfony.lock ]; then
    ws set app.build dynamic
    
    # ensure a full build is done dynamically to get all repo artifacts
    export MY127WS_ENV=local # static tests switch to pipeline
    ws harness prepare
    ws enable console
    ws destroy

    ws set app.build static
fi 


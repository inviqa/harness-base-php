#!/usr/bin/env bash

if [[ "$USE_DOCKER_SYNC" = "yes" ]]; then
    run docker-sync stop
fi

run docker-compose -p "$NAMESPACE" stop

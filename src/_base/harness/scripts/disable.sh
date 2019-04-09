#!/usr/bin/env bash

if [[ "$USE_DOCKER_SYNC" = "yes" ]]; then
    run docker-sync --config .my127ws/docker-sync.yml stop
fi

run docker-compose stop

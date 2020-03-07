#!/usr/bin/env bash

if [[ "$USE_DOCKER_SYNC" = "yes" ]] && [ -f docker-sync.yml ]; then
    run ws docker-sync stop
elif [[ "$USE_MUTAGEN" = "yes" ]]; then
    run ws mutagen pause
fi

run docker-compose stop

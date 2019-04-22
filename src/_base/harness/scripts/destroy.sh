#!/usr/bin/env bash

run docker-compose down --rmi local --volumes --remove-orphans

if [[ "$USE_DOCKER_SYNC" = "yes" ]]; then
  run docker-sync stop
  run docker rm "${NAMESPACE}-sync"
  run docker volume rm "${NAMESPACE}-sync"
fi

if [[ "$APP_BUILD" = "static" ]]; then
    run "docker images --filter=reference='${DOCKER_REPOSITORY}:${APP_VERSION}-*' -q | xargs --no-run-if-empty docker image rm --force"
fi

run rm -f .my127ws/.flag-built

#!/usr/bin/env bash

run docker-compose down --rmi local --volumes --remove-orphans --timeout 120

if [[ "$USE_DOCKER_SYNC" = "yes" ]] && [ -f docker-sync.yml ]; then
  run ws docker-sync clean
  run docker volume rm "${NAMESPACE}-sync"
elif [[ "$USE_MUTAGEN" = "yes" ]]; then
  run ws mutagen stop
  passthru ws mutagen rm
fi

if [[ "$APP_BUILD" = "static" ]]; then
    run "docker images --filter=since='${DOCKER_REPOSITORY}:${APP_VERSION}-console' -q | xargs --no-run-if-empty docker image rm --force"
    run "docker images --filter=reference='${DOCKER_REPOSITORY}:${APP_VERSION}-*' -q | xargs --no-run-if-empty docker image rm --force"
    run "docker images --filter=reference='${NAMESPACE}-*:dev' -q | xargs --no-run-if-empty docker image rm --force"
fi

run rm -f .my127ws/.flag-built

#!/usr/bin/env bash

if [ ! -f .flag-built ]; then
    passthru docker-compose -p "$NAMESPACE" down

    [[ "$HAS_ASSETS" = "yes" ]] && ws assets download

    if [[ "$APP_BUILD" = "dynamic" && "$USE_DOCKER_SYNC" = "yes" ]]; then
        passthru docker-sync start
        passthru docker-sync stop
    fi

    passthru docker-compose -p "$NAMESPACE" pull
    passthru docker-compose -p "$NAMESPACE" build --pull
    passthru docker-compose -p "$NAMESPACE" up -d

    if [[ "$APP_BUILD" = "dynamic" ]]; then
        passthru docker-compose -p "$NAMESPACE" exec -T -u build console app build
    fi
    
    passthru docker-compose -p "$NAMESPACE" exec -T -u build console app init
    touch .flag-built
else
    run docker-compose -p "$NAMESPACE" up -d
    passthru docker-compose -p "$NAMESPACE" exec -T -u build console app welcome
fi

if [[ "$APP_BUILD" = "dynamic" && "$USE_DOCKER_SYNC" = "yes" ]]; then
    passthru docker-sync start
fi

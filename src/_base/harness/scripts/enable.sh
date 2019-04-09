#!/usr/bin/env bash

main()
{
    if [ ! -f .flag-built ]; then
    
        passthru docker-compose down

        if [[ "$HAS_ASSETS" = "yes" ]]; then
            ws assets download
        fi

        $APP_BUILD
        touch .flag-built

    else
        passthru docker-compose up -d
        passthru docker-compose exec -T -u build console app welcome
    fi

    if [[ "$APP_BUILD" = "dynamic" && "$USE_DOCKER_SYNC" = "yes" ]]; then
        passthru docker-sync --config .my127ws/docker-sync.yml start
    fi
}

dynamic()
{
    # we synchronise then stop docker-sync as leaving it running during the build
    # will often cause it to crash.

    if [[ "$USE_DOCKER_SYNC" = "yes" ]]; then
        passthru docker-sync --config .my127ws/docker-sync.yml start
        passthru docker-sync --config .my127ws/docker-sync.yml stop
    fi

    passthru docker-compose pull
    passthru docker-compose build --pull
    passthru docker-compose up -d

    passthru docker-compose exec -T -u build console app build
    passthru docker-compose exec -T -u build console app init
}

static()
{
    ws app build
    
    passthru docker-compose up -d
    passthru docker-compose exec -T -u build console app init
}

main

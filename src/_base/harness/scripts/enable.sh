#!/usr/bin/env bash

main()
{
    if [[ "$APP_BUILD" = "dynamic" ]]; then
        dynamic
    else
        static
    fi
}

dynamic()
{
    if [ ! -f .flag-built ]; then

        passthru docker-compose -p "$NAMESPACE" down

        [[ "$HAS_ASSETS" = "yes" ]] && ws assets download

        # we synchronise then stop docker-sync as leaving it running during the build
        # will often cause it to crash.

        if [[ "$USE_DOCKER_SYNC" = "yes" ]]; then
            passthru docker-sync start
            passthru docker-sync stop
        fi

        passthru docker-compose -p "$NAMESPACE" pull
        passthru docker-compose -p "$NAMESPACE" build --pull
        passthru docker-compose -p "$NAMESPACE" up -d

        passthru docker-compose -p "$NAMESPACE" exec -T -u build console app build
        passthru docker-compose -p "$NAMESPACE" exec -T -u build console app init

        touch .flag-built

    else

        passthru docker-compose -p "$NAMESPACE" up -d
        passthru docker-compose -p "$NAMESPACE" exec -T -u build console app welcome
        
    fi

    [[ "$USE_DOCKER_SYNC" = "yes" ]] && passthru docker-sync start
}

static()
{
    if [ ! -f .flag-built ]; then

        [[ "$HAS_ASSETS" = "yes" ]] && ws assets download

        ws app build
        
        passthru docker-compose -p "$NAMESPACE" up -d
        passthru docker-compose -p "$NAMESPACE" exec -T -u build console app init

        touch .flag-built

    else

        passthru docker-compose -p "$NAMESPACE" up -d
        passthru docker-compose -p "$NAMESPACE" exec -T -u build console app welcome

    fi
}

main

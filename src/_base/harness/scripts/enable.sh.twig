#!/usr/bin/env bash

main()
{
    passthru ws networks external
    if [ ! -f .my127ws/.flag-built ]; then

        passthru docker-compose down

        if [[ "$HAS_ASSETS" = "yes" ]]; then
            ws assets download
        fi

        $APP_BUILD
        touch .my127ws/.flag-built

    else
        passthru docker-compose up -d
        passthru docker-compose exec -T -u build console app welcome
    fi

    if [[ "$APP_BUILD" = "dynamic" && "$USE_DOCKER_SYNC" = "yes" ]]; then
        passthru docker-sync start
    fi
}

dynamic()
{
    # we synchronise then stop docker-sync as leaving it running during the build
    # will often cause it to crash.

    if [[ "$USE_DOCKER_SYNC" = "yes" ]]; then
        passthru gem install docker-sync --no-document
        passthru docker-sync start
        passthru docker-sync stop
    fi

    {% if ("cron" in @('app.services')) %}
        passthru "docker-compose config --services | grep -v php-fpm | xargs docker-compose pull"
        passthru "docker-compose config --services | grep -v cron | xargs docker-compose build --pull"
        passthru docker-compose build cron
    {% else %}
        passthru docker-compose pull
        passthru docker-compose build --pull
        passthru docker-compose up -d
    {% endif %}

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

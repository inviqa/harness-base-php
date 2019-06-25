#!/bin/bash

docker_entrypoint()
{
    # run any command required to be executed at docker startup
    {% for step in @('php-fpm.entrypoint.steps') -%}
    {{ step|raw }}
    {% endfor %}
}

docker_entrypoint

# run
exec supervisord -c /etc/supervisor/supervisord.conf -n

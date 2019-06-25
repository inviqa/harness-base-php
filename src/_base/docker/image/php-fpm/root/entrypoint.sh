#!/bin/bash

docker_entrypoint()
{
    # run any command required to be executed at docker startup
{% if @('php-fpm.entrypoint.steps') is empty %}
    :
{% else %}
    {% for step in @('php-fpm.entrypoint.steps') -%}
    {{ step|raw }}
    {% endfor %}
{% endif %}

}

docker_entrypoint

# run
exec supervisord -c /etc/supervisor/supervisord.conf -n

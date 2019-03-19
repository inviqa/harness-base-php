#!/bin/bash

# run
exec supervisord -c /etc/supervisor/supervisord.conf -n

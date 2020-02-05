#!/bin/bash
IFS=$'\n'
/usr/bin/env - `cat /app/env.sh` "$@" > /proc/1/fd/1 2> /proc/1/fd/2
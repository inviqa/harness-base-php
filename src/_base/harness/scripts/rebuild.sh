#!/usr/bin/env bash

run docker-compose down --rmi local --volumes --remove-orphans --timeout 120

passthru ws cleanup built-images

run rm -f .my127ws/.flag-built .my127ws/.flag-console-built

passthru ws enable

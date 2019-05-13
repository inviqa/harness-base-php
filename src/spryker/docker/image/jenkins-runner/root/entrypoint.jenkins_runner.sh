#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

main()
{
    app jenkins start
    source /entrypoint.sh
}

bootstrap()
{
    app jenkins setup
}

bootstrap
main

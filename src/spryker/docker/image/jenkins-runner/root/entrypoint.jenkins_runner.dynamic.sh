#!/bin/bash

main()
{
    source /entrypoint.dynamic.sh
}

bootstrap()
{
    app jenkins:setup
}

bootstrap
main "$@"

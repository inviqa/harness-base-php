#!/bin/bash

main()
{
    app jenkins start
    source /entrypoint.dynamic.sh
}

bootstrap()
{
    app jenkins setup
}

bootstrap
main "$@"

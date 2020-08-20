#!/bin/bash

main()
{
    source /entrypoint.sh
}

bootstrap()
{
    app jenkins setup
}

bootstrap
main "$@"

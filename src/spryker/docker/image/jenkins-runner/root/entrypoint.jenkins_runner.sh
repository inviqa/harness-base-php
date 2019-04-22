#!/bin/bash

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

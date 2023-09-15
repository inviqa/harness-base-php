#!/bin/bash

main()
{
    source /entrypoint.sh
}

setup_app_networking()
{
    # make linux consistent with docker-for-mac
    if [ "${HOST_OS_FAMILY}" = "linux" ]; then
        DOCKER_INTERNAL_HOST="host.docker.internal"
        if ! grep $DOCKER_INTERNAL_HOST /etc/hosts > /dev/null ; then
            DOCKER_INTERNAL_IP=$(/sbin/ip route|awk '/default/ { print $3 }')
            echo -e "$DOCKER_INTERNAL_IP    $DOCKER_INTERNAL_HOST" | tee -a /etc/hosts > /dev/null
        fi
    fi
}

setup_app_volume_permissions()
{
    case "$STRATEGY" in
        "host-linux-normal")
            usermod  -u "$(stat -c '%u' /app)" www-data
            groupmod -g "$(stat -c '%g' /app)" www-data
            ;;
        "host-osx-normal")
            usermod  -u 1000 www-data
            groupmod -g 1000 www-data
            ;;
        "host-osx-dockersync")
            usermod  -u 1000 www-data
            groupmod -g 1000 www-data
            ;;
        *)
            exit 1
    esac
}

resolve_volume_mount_strategy()
{
    if [ "${HOST_OS_FAMILY}" = "linux" ]; then
        STRATEGY="host-linux-normal"
    elif [ "${HOST_OS_FAMILY}" = "darwin" ]; then
        if (mount | grep "/app type fuse.osxfs") > /dev/null 2>&1; then
            STRATEGY="host-osx-normal"
        elif (mount | grep "/app type fuse.grpcfuse") > /dev/null 2>&1; then
            STRATEGY="host-osx-normal"
        elif (mount | grep "/app type ext4") > /dev/null 2>&1; then
            STRATEGY="host-osx-dockersync"
        elif (mount | grep "/app type btrfs") > /dev/null 2>&1; then
            STRATEGY="host-linux-normal"
        else
            exit 1
        fi
    else
        exit 1
    fi
}

bootstrap()
{
    resolve_volume_mount_strategy
    setup_app_volume_permissions
    setup_app_networking
}

bootstrap
main

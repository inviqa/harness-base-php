#!/usr/bin/env bash

xdebug_version_sync()
{
  INSTALLED_VERSION=$(docker-compose exec -T -u root "$1" pecl info xdebug 2>&1 | grep "Release Version" | awk '{print $3}')
  INSTALLED_MAJOR_VERSION=$(echo "$INSTALLED_VERSION" | cut -d '.' -f1)

  if [ "$INSTALLED_MAJOR_VERSION" == "$XDEBUG_VERSION" ]; then
    echo "Xdebug in $1 is already on the desired major version $XDEBUG_VERSION (found installed version $INSTALLED_VERSION)"
    return 0
  fi

  case $XDEBUG_VERSION in
    "3")
      INSTALL_CANDIDATE="xdebug"
      ;;
    "2")
      INSTALL_CANDIDATE="xdebug-2.9.8"
      ;;
    *)
      echo "Invalid Xdebug version provided - please check the 'php.ext-xdebug.version' attribute is '2' or  '3'."
      exit 1
  esac

  run docker-compose exec -T -u root "$1" pecl uninstall xdebug
  run docker-compose exec -T -u root "$1" pecl install "$INSTALL_CANDIDATE"
}

xdebug_version_sync 'console'
xdebug_version_sync 'php-fpm'

# Upgrade Guide

In addition to the README's [Harness Upgrade Instructions], please note these specific version upgrade instructions.

## Upgrading from 0.12.x to 1.0.x

### Helm charts

* `.Values.service.<service>` true/false enabled array is now `.Values.services.<service>.enabled`, as set by `attribute('services.<service>.enabled')`
* `.Values.docker.services` is now `.Values.services`, as set by `attribute('services')` run through a `filter_local_services()` function call, which restricts which keys are available to helm to exclude environment_secrets.
* `.Values.docker.image.<service>` is now `.Values.services.<service>.image`
* `.Values.resources.memory.<service>` is now `.Values.services.<service>.resources.memory`

#### Spryker



### Removal of docker-sync

If you use docker-sync on macOS, you can convert to mutagen with the following commands:
```bash
docker-sync stop
docker rm "<workspace-project-name>-sync"
ws switch mutagen
```

### Removed attributes

* `attribute('pipeline.publish.chart.git.key')` - replaced with `attribute('pipeline.publish.chart.git.ssh_private_key')`
* `attribute('docker.config')` - replaced with `attribute('docker.image_pull_config')`
* `attribute('git.main_branch')` - replaced with `attribute('git.default_branch')`
* `attribute('resources.cpu.requests.<service>')` - no equivalent
* `attribute('resources.cpu.limits.<service>')` - no equivalent
* `attribute('resources.memory.<service>')` - replaced with `attribute('services.<service>.resources.memory')`
* `attribute('resources.memory.app_init')` - replaced with `attribute('services.console.resources.init_memory')`
* `attribute('resources.memory.app_migrate')` - replaced with `attribute('services.console.resources.migrate_memory')`
* `attribute('pipeline.preview.resources.memory.<service>')` - replaced with `attribute('pipeline.preview.services.<service>.resources.memory')`
* `attribute('pipeline.production.resources.memory.<service>')` - replaced with `attribute('pipeline.production.services.<service>.resources.memory')`

### Removed functions

* The function `deep_merge_to_yaml` has been removed. Please convert from:
```yaml
deep_merge_to_yaml([...], 2, 2)
```
to:
```yaml
to_nice_yaml(deep_merge([...]), 2, 2)
```

### Renamed attributes

* If you use AWS for asset downloads, rename `attribute('aws.id')` to `attribute('aws.access_key_id')` and
`attribute('aws.key')` to `attribute('aws.secret_access_key')`
* Magento 2's static content deploy attribute `attribute('magento.static_content.backend')` is now
`attribute('magento.static_content.adminhtml')`
* Any attributes mentioning `redis_session` should be renamed to `redis-session`

### Removed templates

The following templates have been removed:
* _twig/docker-compose.yml/application.yml.twig - replaced with _twig/docker-compose.yml/service/console.yml.twig and _twig/docker-compose.yml/service/webapp.yml.twig
* _twig/docker-compose.yml/environment.yml.twig - replaced with `attribute('services.php-base.environment')` and `attribute('services.php-base.environment_secrets')`
* helm/app/_twig/values.yaml/environment.yml.twig - replaced with `harness/attributes/docker*.yml` which can be used via `attribute('services.<service>.environment')`
* helm/app/_twig/values.yaml/resources.yml.twig - replaced with `.Values.services.<service>.resources.memory`
* Akeneo's helm/app/values.yaml.twig
* Spryker's _twig/docker-compose.yml/environment.yml.twig - replaced with `attribute('services.php-base.environment_dynamic')` which sets up appropriate store-specific hostnames.
* Spryker's _twig/docker-compose.yml/nginx_environment.yml.twig - replaced with `attribute('services.nginx.environment_dynamic')` which sets up appropriate store-specific hostnames.
*

## Upgrading from 0.11.x to 0.12.x

### Composer

* Composer version 2 necessitates upgrading of composer packages that act as plugins. If you cannot upgrade at this
time, you can revert to Composer version 1 in `workspace.yml` like so:
```yaml
attribute('php.composer.major_version'): 1
```

* Composer version 2 no longer autoloads classes that do not conform to the PSR-0 or PSR-4 autoloading specification.
Double check any messages you get from the autoloader step of `composer install` or `composer dump-autoload`.

* With the switch to composer's authoritative classmap, even with version 1, projects should ensure all classes that
need to be autoloadable via composer are available in composer.json's autoload or autoload-dev sections.

  * For Drupal 8, this entails adding the `fenetikm/autoload-drupal` composer plugin.
  * For Magento 2, ensure `generated/code/` is present in the autoload section.

### Helm charts

Helm-standard labels have been added to all resources which will cause a redeployment of all services. This will incur
downtime for any services that use persistent storage backed by ReadWriteOnce volume (i.e. anything that isn't NFS).

### Magento 2

In app/etc/config.php, if you set system->default->general->locale->code to something other than en_US, ensure you
set up `attribute('magento.static_content')` to cover that locale, or there will be 404s for static assets.

### Opcache

A file based opcache is now in use for command line applications when in production mode. If you change any PHP file
that a subsequent command needs to access the new content of, clear `/tmp/php-file-cache/*`. This is handled during the
build of docker images in relation to composer and new autoloader files, but a project may have custom setup.

[Harness Upgrade Instructions]: https://github.com/inviqa/harness-base-php#harness-upgrade-instructions

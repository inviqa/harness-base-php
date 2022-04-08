# Upgrade Guide

In addition to the README's [Harness Upgrade Instructions], please note these specific version upgrade instructions.

## Upgrading from 1.2.x to 1.3.x

### Kubernetes Ingress v1
Cloud Kubernetes providers such as Digitial Ocean will be forcing upgrades of Kubernetes to 1.22 in a few months, and will obsolete, amongst other things, Ingress extensions/v1beta1 and networking.k8s.io/v1beta1 apiVersions.

This release includes an upgrade from networking.k8s.io/v1beta1 to networking.k8s.io/v1 apiVersion of Ingress resources to handle that.

Care is needed to ensure GitOps cluster deploy tools can handle this, which includes ArgoCD needing to be at least version 1.8, due to a bug in applying networking.k8s.io/v1 Ingresses failing.

### All projects with admins
Since it can be a forgotten step to change the password of the default admin users when created, the default password is now only set on local development environments.

In order to deploy to new environments, an environment secret `ADMIN_DEFAULT_PASSWORD` will need setting on the `console` service. Do not use the original default password.

It is optional now to change the password after, if a secure password is used, however it can be more secure doing so and removing `ADMIN_DEFAULT_PASSWORD` after first deployment.

### MySQL

We are switching back to Docker Inc's official mysql for arm64 computers, as it now supports arm64 on 8.0-oracle tag. This was also done because Oracle's mysql-server repository changed it's image publishing structure to no longer be multi-platform images.

You can switch to any of the previous settings setting:

e.g. to Docker Inc's official mysql 5.7 (with no arm64 support)
```
attribute('mysql.tag'): 5.7
# since it's a multi-platform image of only one platform
attribute('services.mysql.platform'): linux/amd64 
```

### Spryker
With support for Spryker 202108.0 release, we have upgraded the Elasticsearch version to 7.x and also there is a change in
Zed application's root directory (Spryker now supports different entrypoints for backoffice and Zed gateway applications).
However, both of these changes are not backward compatible. So, to make sure we do not break projects using old demoshop version,
we are using `spryker.demoshop-version` attribute to apply these changes conditionally.

In order to make sure your project uses the right version of Elasticsearch and Zed root directory, make sure you set the 
right `spryker.demoshop-version` in your workspace.yml

## Upgrading from 1.1.x to 1.2.x

### Chrome

Chrome is yet to release linux amd64 binaries so docker services `chrome` and `lighthouse` will use
Chromium instead for the time being.

Chrome fails to start if trying the linux/amd64 docker image on arm64 hosts due to qemu errors.

Chromium will have fewer fonts that are not FOSS, and the vendor does not support software 3D
rendering, so it will be switched back in a later harness release to Chrome once a arm64 release
is made.

### MySQL

MySQL has been upgraded from 5.7 to 8.0 in platforms that use it. This is so arm64 images can be
used from Oracle's official docker repository [mysql/mysql-server](https://hub.docker.com/r/mysql/mysql-server).

amd64 hosts can continue to use Docker's official docker repository [mysql](https://hub.docker.com/_/mysql).

If it's necessary, you can switch down to version 5.7 through:
```yaml
attribute('mysql.tag'): 5.7
attribute('database.platform_version'): 5.7
```
however there may be instability and performance issues doing so on arm64 hosts using amd64
emulation.

## Upgrading from 1.0.x to 1.1.x

### Buildkit

Buildkit is now used for docker image builds both in Jenkins and locally.

To opt out from buildkit in Jenkins, set `attribute('jenkins.docker.buildkit.enabled'): false`.

To opt out from buildkit locally, set `attribute('docker.buildkit.enabled'): false`.

### Jenkins

#### Minimal Build

Jenkins now performs a minimal build with the `console` docker image and no supporting services,
to allow faster feedback for linting or unit test issues.
If this minimal build passes, Jenkins will launch a full build to run integration tests.

If linting or unit tests need supporting services like a database or cache to be available,
set `attribute('jenkins.tests.isolated'): true` to revert to the old behaviour.

#### Lighthouse

Jenkins now runs a Lighthouse check against the default URL of the site as an integration test.
The URL being tested can be configured with `attribute('lighthouse.target.url')`.

Thresholds for passing scores can also be configured by setting the `enabled` (true/false) and `score` (integer)
of these attributes:
```yaml
lighthouse:
  success-thresholds:
    pwa:
      enabled: false
      score: 0
    seo:
      enabled: false
      score: 0
    best-practices:
      enabled: false
      score: 0
    accessibility:
      enabled: false
      score: 0
    performance:
      enabled: false
      score: 0
```

### Magento 2

Magento 2.4.2 brings composer v2 support. To continue using composer v1 on older magento releases, please set
`attribute('magento.version')` to the magento version in use.

## Upgrading from 0.12.x to 1.0.x

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
* Akeneo's helm/app/values.yaml.twig - now using version from _base
* Spryker's _twig/docker-compose.yml/environment.yml.twig - replaced with `attribute('services.php-base.environment_dynamic')` which sets up appropriate store-specific hostnames.
* Spryker's _twig/docker-compose.yml/nginx_environment.yml.twig - replaced with `attribute('services.nginx.environment_dynamic')` which sets up appropriate store-specific hostnames.
* Spryker's helm/app/_twig/values.yaml/environment.yml.twig - replaced with `attribute('services.php-base.environment_dynamic')` which sets up appropriate store-specific rabbitmq vhost environment variables.
* Spryker's helm/app/values.yaml.twig - now using version from _base.
* Spryker's helm/qa/values.yaml.twig - now using version from _base.

### Helm charts

* `.Values.service.<service>` true/false enabled array is now `.Values.services.<service>.enabled`, as set by `attribute('services.<service>.enabled')`
* `.Values.docker.services` is now `.Values.services`, as set by `attribute('services')` run through a `filter_local_services()` function call, which restricts which keys are available to helm to exclude environment_secrets.
* `.Values.docker.image.<service>` is now `.Values.services.<service>.image`
* `.Values.resources.memory.<service>` is now `.Values.services.<service>.resources.memory`
* Now only compatible with Kubernetes 1.16+ due to ingress API version changes

#### Spryker

Spryker's values.yaml.twig now uses the version from _base, shared across all frameworks.

The default value for `resourcePrefix` was previously `{{ @('workspace.name') ~ '-' }}`.

To avoid setting up new services as a different name in kubernetes, add the following to the project's `workspace.yml`:
```yaml
attribute('pipeline.base.resourcePrefix'): = @('workspace.name') ~ '-'
```

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

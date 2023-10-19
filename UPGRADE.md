# Upgrade Guide

In addition to the README's [Harness Upgrade Instructions], please note these specific version upgrade instructions.

## Upgrading from 1.6.x to 2.0.x

### Docker harness now needed as a harness layer

The docker harness now provides the functionality multiple harnesses need, so the PHP harness has had a lot stripped out and now depends on the docker harness.

When you upgrade you'll need to change your workspace.yml to reference both harnesess like:

```diff
 workspace('my-app'):
-  harness: inviqa/php:v1.6.0
+  harnessLayers:
+    - inviqa/docker:v0.3.0
+    - inviqa/php:v2.0.0
```

This requires my127 Workspace version 0.3.1+ for general operation, but 0.4.0+ for `ws create` to automatically add the docker harness.

### Attributes changed

harness attributes:

* `app.services[]: *` -> `services.*.enabled: true` - backwards compatibility removed
* `backend.*.when`, `frontend.*.when` - are now full bash if conditions, so `-f package.json` becomes `"[ -f package.json ]"`, and `"true"` and `"false"` now is semantically valid
* `docker.image.*` -> `services.*.build.from`
* `persistence.*.*` -> `persistence.*-*` - now using a flat structure for consistency for templating. e.g. `persistence.drupal.files` becomes `persistence.drupal-files`
* `persistence.jenkins` -> `persistence.jenkins-home`
* `persistence.solr` -> `persistence.solr-data`
* `services.*.options` -> `services.*.config.options` - i.e for (mysql, redis, and redis-session)

helm values:

* `feature.sealed_secrets` -> `global.sealed_secrets.enabled`
* `ingress` -> `ingresses.webapp`
* `istio` -> `global.istio`
* `prometheus` -> `global.prometheus`
* `replicas.varnish` -> `services.varnish.replicas` - however the value has been removed, as the default is 1
* `resourcePrefix` - oboleted, see below for further information

### `docker-compose` command now `docker compose`

In line with the preferred way to run Docker Compose v2, the harness will now use the binary from it's Docker plugin architecture.

This means all `docker-compose` commands are replaced with `docker compose`. For Docker Desktop users there is no difference, however Linux users may need to [install the Compose plugin](https://docs.docker.com/compose/install/linux/).

If you really would like to continue using the old command, you can set in your `~/.config/my127/workspace/config.yml`:

```yaml
attribute('docker.compose.bin'): docker-compose
```

### .my127ws/docker/app mult-stage Dockerfile replacing all php-derrived images

.my127ws/docker/app has combined the php-fpm, cron, Akeneo job-queue-consumer, and Spryker jenkins-runner Dockerfile build contexts into one multi-stage Dockerfile (with templating of each stage still separate).

This was in order to remove the use of intermediate image stage builds in favour of Docker's native multi-stage builds. The resulting images will still be the same, but Docker can now build them even more efficiently without harness logic ordering the builds, and so allowing less logic to be per-harness and instead able to use the new docker harness with fewer layer overrides.

The result is, if you are extending these images with overlay, you'll need to match the new directory structure within docker/app. Any additional PHP images you create on top of what the harness provides can use this same pattern.

### Helm value .resourcePrefix obsoleted in favour of helm release name

`resourcePrefix` is now oboleted, instead the helm release name will be used. 

It may be necessary to set the release name manually in some cases.

e.g. ArgoCD clusters due to k8s-project-cluster defaults incorrectly using the environment name in the release name

```diff
 environments:
   - name: test
     services:
       - name: myapp
         source:
           path: build-artifacts/myapp/main
           helm:
+            releaseName: myapp # since it will default to test-myapp
             values:
-              resourcePrefix: myapp-
```

If you were not using resourcePrefix (and so resource names were just e.g. `webapp`, `mysql` etc) then you may need to put more planning into a solution to avoid downtime.

Older PersistentVolumeClaim names were generally hard-coded resource names, and continue to use those old resource names, so unaffected, but newer PVCs you can set the persistence.*.claimName to the original resource name, and then they will remain.

### Helm templates pod affinity no longer used for pod spread across zones and hosts

Topology spread constraints are better suited to pod spread than anti-affinity, as will continue to spread more evenly once replicas is higher than the ordinal constraint (e.g. 6 replicas across 3 zones will try to prioritise 2 replicas per zone for).

Pod anti-affinity would instead stop prioritising once replicas are higher than the ordinal topology key constraint (e.g. > 3 replicas across 3 zones), causing further pods to be scheduled randomly and potentially put a majority in one zone. This would, in the event of zone downtime, hit the application's HA unfairly reducing accessible pods more than a proportional amount.

`services.*.topologySpreadConstraints` has been supported since the harness version 1.5.0, so `services.*.affinity.selfAntiAffinityTopologyKey` has been removed. `services.*.affinity` will still support the Affinity v1 core specification of Pod resources however.

If you haven't migrated your HA deployments to `topologySpreadConstraints`, then the change is e.g.:

```diff

 global:
-   affinity:
-     selfAntiAffinityTopologyKey: topology.kubernetes.io/zone
+   topologySpreadConstraints:
+     - topologyKey: topology.kubernetes.io/zone
```

Or if it was needed per service (though global is preferred if no reason to):

```diff
 services:
   myapp:
-     affinity:
-       selfAntiAffinityTopologyKey: topology.kubernetes.io/zone
+     topologySpreadConstraints:
+       - topologyKey: topology.kubernetes.io/zone
```

### Kubernetes persistence enabled by default

Since it makes more sense for persistence to be enabled for environments, and previously backend service persistence was also enabled by default, persistence of application volumes is now also enabled by default.

Both application and backend services have two enabled flags now, `persistence.enabled` for a global toggle, and `persistence.*.enabled` for an individual toggle.

Since it's unlikely that the Kubernetes cluster you would be releasing to would support ReadWriteMany for it's default storageclass, you will need to define the PersistentVolumeClaim's storageClass, which may be, for example `nfs`. Not providing a storageClass or selector would fail to obtain a PersistentVolume for the claim, and so the Pod would never start.

```diff
 persistence:
   app-data:
+    storageClass: nfs
```

Previously `persistence.enabled` was only used for application volumes, but now includes backend service volumes, so if you do need to disable application volume persistence without disabling service volume persistence, you need to individually disable the application persistence:

```diff
 persistence:
-  enabled: false 
   app-data:
+    enabled: false
```

### Helm PersistentVolume hostPath obsolete

Since hostPath PersistentVolumes are technically not perisistent (they get wiped on upgrade or replacement of a node), they are inappropriate to be used, so have been obsoleted. No service was using them by default.

The managed Kubernetes clusters such as DigitalOcean and AWS have ReadWriteOnce capable storage classes that can be migrated to instead, though a ReadWriteMany capable storage class is preferred for Deployments.

## Upgrading from 1.5.x to 1.6.x

### /bin and /lib are now /usr/bin and /usr/lib

The latest linux distributions have merged several top-level folders with their /usr folders. The top-level folder has been replaced with a symlink. This isn't supported in Docker COPY operations, so its now changed to the canonical folder names under /usr

For the harnesses, this means:

* Files copied to /bin are now copied to /usr/bin instead.
* Files copied to /lib are now copied to /usr/lib instead.

If you don't override or add any /lib/task files in your workspace overlay (usuually in tools/workspace/docker/console/lib), or add any /bin files, then you'll likely not need to change anything for this in the upgrade, but otherwise you'll also need to use this folder structure.

Whilst Debian 11 (Bullseye) and lower are not merging the folders, the location in the harness still has changed to be under /usr for them, since still compatible with their folder structure.

For PHP images using Debian 12 (Bookworm), this change is necessary.

## Upgrading from 1.4.x to 1.5.x

### Drupal Writable Directories

The drupal harness no longer sets /app/config, /app/docroot/modules and /app/docroot/profiles to be web-writable at runtime.

This means that modules cannot be installed via the admin interface unless you are running in the development environment.

If there is a need from a given module to be in a web-writable directory, you can add that particular module to the `app.web_writable_dirs` attribute
in your workspace.yml like so:
```yaml
attribute('app.web_writable_dirs'):
  - '/app/docroot/sites/default/files'
  - '/app/docroot/modules/MODULE_NAME/tmp/'
```

Alternatively, if it's just one file needing to be writable:
```yaml
attribute('app.web_writable_files'):
  - '/app/docroot/modules/MODULE_NAME/path/to/file.png
```

### Tideways default application

The default service name for new tideways applications has changed from "web" to "app".

The php.ini configuration for tideways been adjusted to reflect this to avoid confusion with new applications.

To use the old service name "web", set this attribute in your workspace.yml:
```yaml
attribute('php.ext-tideways.config.service'): web
```

### Webapp php-fpm no longer to be individually disablable

The introduction of being able to disable the php-fpm container within webapp/deployment.yml helm template introduced a bug in local docker.

Rather than add complexity to fix it, the helm template will no longer have this capability.

Instead if a project needs a nginx-only Kubernetes Deployment resource, we'd suggest you create a new nginx/deployment.yml to better identify its use.

Webapp can instead be set to `enabled: false` to remove the service both in docker and helm.

## Upgrading from 1.4.0 to 1.4.1

An unintentional helm service key name `resources.cpu.requests` has dropped it's plurality to `resources.cpu.request` to match some existing implementations.

If you have set the cpu requests already, then please update to the latter.

## Upgrading from 1.3.x to 1.4.x

### Debian Bullseye for PHP 8+

my127/docker-php has had bullseye images for a while now, and they solve several issues, including mariadb providing an additional sha256_password.so mysql client plugin that some mysql 8+ servers use.

Additionally we have also introduced PHP 8.0 and 8.1 to Akeneo as Debian Bullseye images only, and PHP 8.1 for most harnesses as Debian Bullseye images only.

So the release will now default to the bullseye distribution PHP docker images if the php.version attribute is 8.0 or greater.

It's possible to override this behaviour now via an attribute.

e.g. to downgrade back to buster:

```yaml
attribute('php.distro_codename'): buster
```

### Solr image now built and deployable

The solr service previously was only usable for local development, but in some cases this may need to be deployed, so the service has a build step now.

This means if enabled, then by default, it will publish the docker image to the remote registry and the helm chart by default deploy to the Kubernetes environment.

The `services.solr.image` attribute is now being used for the built image tag, so the source image is now defined in `services.solr.build.image`, which, if your project has changed, will need to be reflected.

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

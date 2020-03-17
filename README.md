# Harness Base PHP for [Workspace]

A [Workspace] harness is a way to ship files to a project without being part of the project.

In this repository are a set of harnesses that have been created for the PHP language, reducing the maintenance overhead
of the individual harnesses greatly. This is due to the "base" PHP harness being used as a common set of templates.

Each framework will fully override a base harness file if differing behaviour is required.

## Available Frameworks

* [PHP (used as a base for everything else)](src/_base/), published to [inviqa/harness-php]
* [Akeneo (PIM)](src/akeneo/), published to [inviqa/harness-akeneo]
* [Drupal 8 (CMS)](src/drupal8/), published to [inviqa/harness-drupal8]
* [Magento 1.x (Ecommerce)](src/magento1/), published to [inviqa/harness-magento1]
* [Magento 2.x (Ecommerce)](src/magento2/), published to [inviqa/harness-magento2]
* [Spryker (Ecommerce)](src/spryker/), published to [inviqa/harness-spryker]
* [Symfony](src/symfony/), published to [inviqa/harness-symfony]
* [Wordpress (CMS)](src/wordpress/), published to [inviqa/harness-wordpress]

## Features of each harness

* Local docker-compose development environment
* Skeleton for simple set-up of new projects
* Pipeline docker-compose environment for use in Jenkins or other tools to run tests
* Helm chart for deploying QA, UAT and Production environments to Kubernetes clusters

## Helm charts

Each harness deploys:
* A "console" pod for running one-off commands
* A NGINX/PHP-FPM "webapp" pod for running the php-based application and serving web requests
* A service to route to the "webapp" pods
* An ingress definition to route via the "webapp" service
* Optionally, a "cron" pod for running cronjobs
* Optionally, elasticsearch, mysql, postgres, redis for supporting services

### Memory

The memory requests for pods have been deliberately set to be the same as the limits.

This is to avoid nodes going to "NotReady" status due to dockerd/containerd/kubelet being killed by the kernel.

An example:
Requesting 10Mi of memory but allowing the pod to spike to 1024Mi means that kubernetes will schedule the pod it onto a
node with 10Mi allocatable memory left. It doesn't consider the limits at all when scheduling pods.

As soon as something in the pod starts using more than 10Mi when the node is already at capacity, kubelet attempts to
kill processes in the container to get back down to 10Mi.

Sometimes kubelet does not manage to kick in fast enough and the Linux kernel's Out Of Memory (OOM) killer kicks in
instead. Whilst core kubernetes processes such as dockerd, containerd and kubelet have an extremely low priority for
the OOMKiller, sometimes the kernel decides to kill one of these core processes anyway as it would free up the most
memory, leading to the node having issues.

## Testing

The final harness version for each of the frameworks is put together by the [build script](./build) into a "dist"
folder. This is used for testing in Jenkins.

### Static mode

1. Run `./build`
2. Create and change to a tests directory
```bash
mkdir tests
cd tests
ws create <framework>-test inviqa/<framework> --no-install
```
3. Copy the built version of harness-base-php's ``./dist/<framework>`` dir to `<framework>-test/.my127ws` directory
```bash
cp -pR ../dist/harness-<framework>/ <framework>-test/.my127ws/
```
4. Change directory to `<framework>-test`
```bash
cd `<framework>-test`
```
5. Update the override file in `<framework>-test`:
```bash
echo 'attribute(\'docker-sync\'): off' >> workspace.override.yml
```
6. Run in `pipeline` mode to activate `static` mode
```bash
MY127WS_ENV=pipeline ws install
```

## Deployment

The [deploy script](./deploy) does a similar thing but the end result is output to `src/<framework>`, where it is then
committed as a publish commit to a temporary build branch.

A "subtree-split" is then performed which outputs a directory for each folder into a "publish" folder, where it is then
force pushed to the individual harness repositories' `0.2.x` branch.

Once the individual harness repository has the latest 0.2.x branch, a tag can be made in each repository (manually).

[Workspace]: https://github.com/my127/workspace
[inviqa/harness-php]: https://github.com/inviqa/harness-php
[inviqa/harness-akeneo]: https://github.com/inviqa/harness-akeneo
[inviqa/harness-drupal8]: https://github.com/inviqa/harness-drupal8
[inviqa/harness-magento1]: https://github.com/inviqa/harness-magento1
[inviqa/harness-magento2]: https://github.com/inviqa/harness-magento2
[inviqa/harness-spryker]: https://github.com/inviqa/harness-spryker
[inviqa/harness-symfony]: https://github.com/inviqa/harness-symfony
[inviqa/harness-wordpress]: https://github.com/inviqa/harness-wordpress

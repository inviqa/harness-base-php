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

### Deploy Script

The [deploy script](./deploy) does a similar thing but the end result is output to `src/<framework>`, where it is then
committed as a publish commit to a temporary build branch.

A "subtree-split" is then performed which outputs a directory for each folder into a "publish" folder, where it is then
force pushed to the individual harness repositories' `0.10.x` branch.

## Release

### Changelog Generation

We are keeping a changelog, powered by [GitHub Changelog Generator].

When ready to tag a release, make a new branch from the `0.10.x` branch for the changelog entries:
1. Generate a `repo` scope token for use with the changelog generator: https://github.com/settings/tokens/new?description=GitHub%20Changelog%20Generator%20token
2. Export it in your environment: `export CHANGELOG_GITHUB_TOKEN=...`
3. Run the following docker command to generate the changelog, replacing `0.10.0` with the version number as needed:
  ```bash
  docker run -e CHANGELOG_GITHUB_TOKEN="$CHANGELOG_GITHUB_TOKEN" -it --rm -v "$(pwd)":/usr/local/src/your-app ferrarimarco/github-changelog-generator --user inviqa --project harness-base-php --exclude-labels "duplicate,question,invalid,wontfix,skip-changelog" --future-release 0.10.0
  ```
4. Examine the generated CHANGELOG.md. For every entry in the `Merged pull requests` section, examine the Pull Requests
   and assign each pull request either a `enhancement` label for a new feature, `bug` for a bugfix or `deprecated` for
   a deprecation.
5. For each Pull Request in the release, assign an appropriate `harness-*` label.
6. Re-generate the changelog using step 3 as needed.
7. Adjust the version for each framework's README.md: `sed -i'' s/v0\.9\.0/v0.10.0/ src/*/README.md`
8. Commit the resulting changes, push and raise a pull request.
9. Once merged, continue with the release process below.

### Performing a Release

Once the CHANGELOG.markdown is in the branch you wish to release:

1. Tag the release version with `git tag 0.10.0 -m "v0.10.0"`
2. Push the tag to the repository: `git push origin 0.10.0`
3. Verify you don't have any ignored files in `src/`, and clean up if you do: `git status --ignored`
4. Run the deploy script: `./deploy`
5. Submit a pull request to [my127/my127.io] which adds the new release version and asset download URL for the
   php-based harnesses to `harnesses.json`
6. Create a "Github Release" for this repository and downstream repositories, pasting in the changelog for the release:
   - https://github.com/inviqa/harness-base-php/releases/new?tag=0.10.0&target=0.10.x
   - https://github.com/inviqa/harness-php/releases/new?tag=0.10.0&target=0.10.x
   - https://github.com/inviqa/harness-akeneo/releases/new?tag=0.10.0&target=0.10.x
   - https://github.com/inviqa/harness-drupal8/releases/new?tag=0.10.0&target=0.10.x
   - https://github.com/inviqa/harness-magento1/releases/new?tag=0.10.0&target=0.10.x
   - https://github.com/inviqa/harness-magento2/releases/new?tag=0.10.0&target=0.10.x
   - https://github.com/inviqa/harness-spryker/releases/new?tag=0.10.0&target=0.10.x
   - https://github.com/inviqa/harness-symfony/releases/new?tag=0.10.0&target=0.10.x
   - https://github.com/inviqa/harness-wordpress/releases/new?tag=0.10.0&target=0.10.x

### Post-release actions

If the next release does not make sense to be in the current 0.10.x branch:

1. Create a new branch:
  ```bash
  git checkout -b 0.11.x
  ```
2. Adjust references from 0.10.x to 0.11.x:
  ```bash
  grep -FR '0.10.x' .
  grep -FR '0.11.x' .
  # Edit resulting files
  ```
3. Adjust references in this file from 0.10.0 to 0.11.0:
  ```bash
  grep -FR '0.10.0' README.md
  grep -FR '0.11.0' README.md
  # Edit resulting files
  ```
4. Commit the resulting files and push:
  ```bash
  git add -p
  git commit
  git push origin -u HEAD
  ```
5. Change the default branch in GitHub settings and re-target any open PRs against the new default branch.
6. Run a deployment of the 0.11.x branch so the branches now exist in the downstream repositories:
  ```bash
  ./deploy
  ```
7. Adjust each downstream repository's default branch so people can easily follow the README

[Workspace]: https://github.com/my127/workspace
[GitHub Changelog Generator]: https://github.com/github-changelog-generator/github-changelog-generator
[inviqa/harness-php]: https://github.com/inviqa/harness-php
[inviqa/harness-akeneo]: https://github.com/inviqa/harness-akeneo
[inviqa/harness-drupal8]: https://github.com/inviqa/harness-drupal8
[inviqa/harness-magento1]: https://github.com/inviqa/harness-magento1
[inviqa/harness-magento2]: https://github.com/inviqa/harness-magento2
[inviqa/harness-spryker]: https://github.com/inviqa/harness-spryker
[inviqa/harness-symfony]: https://github.com/inviqa/harness-symfony
[inviqa/harness-wordpress]: https://github.com/inviqa/harness-wordpress
[my127/my127.io]: https://github.com/my127/my127.io

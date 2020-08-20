# Changelog

## [0.9.2](https://github.com/inviqa/harness-base-php/tree/0.9.2) (2020-08-19)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.9.1...0.9.2)

**Fixed bugs:**

- Fix quoting of commit message [\#367](https://github.com/inviqa/harness-base-php/pull/367) ([kierenevans](https://github.com/kierenevans))
- Fix not having output for failed commands [\#364](https://github.com/inviqa/harness-base-php/pull/364) ([kierenevans](https://github.com/kierenevans))
- Fix db console command [\#363](https://github.com/inviqa/harness-base-php/pull/363) ([kierenevans](https://github.com/kierenevans))

## [0.9.1](https://github.com/inviqa/harness-base-php/tree/0.9.1) (2020-08-17)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.9.0...0.9.1)

**Fixed bugs:**

- Fix drupal site:install by skipping bug in drupal/console 1.9.5 [\#362](https://github.com/inviqa/harness-base-php/pull/362) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix escaping in helm chart git commit [\#361](https://github.com/inviqa/harness-base-php/pull/361) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix trailing newlines being added into secrets before encryption [\#360](https://github.com/inviqa/harness-base-php/pull/360) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add missing external images of service images that have no build [\#358](https://github.com/inviqa/harness-base-php/pull/358) ([andytson-inviqa](https://github.com/andytson-inviqa))

## [0.9.0](https://github.com/inviqa/harness-base-php/tree/0.9.0) (2020-08-12)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.8.0...0.9.0)

**Implemented enhancements:**

- Make external\_images function more readable [\#356](https://github.com/inviqa/harness-base-php/pull/356) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Switch sealed-secrets off [\#355](https://github.com/inviqa/harness-base-php/pull/355) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Pull external images in parallel before building service images [\#354](https://github.com/inviqa/harness-base-php/pull/354) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Use more context related docker attribute paths [\#353](https://github.com/inviqa/harness-base-php/pull/353) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix multiple argument run/passthru escaping and migrate most to use it [\#351](https://github.com/inviqa/harness-base-php/pull/351) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Run standalone phpstan over magento2 in production mode [\#350](https://github.com/inviqa/harness-base-php/pull/350) ([kierenevans](https://github.com/kierenevans))
- Support helm v3 cli by avoiding helm init [\#349](https://github.com/inviqa/harness-base-php/pull/349) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Remove node\_modules from console image. Clear cache [\#347](https://github.com/inviqa/harness-base-php/pull/347) ([kierenevans](https://github.com/kierenevans))
- Use production webpack build when in static mode for akeneo [\#346](https://github.com/inviqa/harness-base-php/pull/346) ([kierenevans](https://github.com/kierenevans))
- Deduce the docker registry\_url from repository [\#345](https://github.com/inviqa/harness-base-php/pull/345) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Bump Magento to 2.3.5-p2 [\#344](https://github.com/inviqa/harness-base-php/pull/344) ([kierenevans](https://github.com/kierenevans))
- Add ability to define env vars from k8s secrets [\#342](https://github.com/inviqa/harness-base-php/pull/342) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add new core Composer tools [\#341](https://github.com/inviqa/harness-base-php/pull/341) ([opdavies](https://github.com/opdavies))
- Support image pull configuration using sealed-secrets [\#339](https://github.com/inviqa/harness-base-php/pull/339) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Use docker-compose build/push and service push config [\#338](https://github.com/inviqa/harness-base-php/pull/338) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Use mutagen.yml config to manage mutagen docker containers [\#336](https://github.com/inviqa/harness-base-php/pull/336) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Use fully expressive variable name for git ssh private key [\#335](https://github.com/inviqa/harness-base-php/pull/335) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Do not install development dependencies in built docker image [\#331](https://github.com/inviqa/harness-base-php/pull/331) ([kierenevans](https://github.com/kierenevans))
- Avoid copying node\_modules to php-fpm [\#329](https://github.com/inviqa/harness-base-php/pull/329) ([kierenevans](https://github.com/kierenevans))
- Avoid copying vendor folder to NGINX, apart from akeneo [\#328](https://github.com/inviqa/harness-base-php/pull/328) ([kierenevans](https://github.com/kierenevans))

**Fixed bugs:**

- varnish hostname needs to be set dynamically [\#332](https://github.com/inviqa/harness-base-php/issues/332)
- Make chart git ssh\_private\_key backwards compatible deprecation [\#343](https://github.com/inviqa/harness-base-php/pull/343) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Remove spryker console dev image [\#340](https://github.com/inviqa/harness-base-php/pull/340) ([kierenevans](https://github.com/kierenevans))
- Set host volume options to cached and make a delegated-volumes flag [\#334](https://github.com/inviqa/harness-base-php/pull/334) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix varnish cache clearing for magento2 when using resource prefixes [\#333](https://github.com/inviqa/harness-base-php/pull/333) ([kierenevans](https://github.com/kierenevans))
- Use the production DI for magento2 in phpspec/phpstan [\#330](https://github.com/inviqa/harness-base-php/pull/330) ([kierenevans](https://github.com/kierenevans))

## [0.8.0](https://github.com/inviqa/harness-base-php/tree/0.8.0) (2020-06-18)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.7.0...0.8.0)

**Breaking changes:**

- Add Varnish [\#309](https://github.com/inviqa/harness-base-php/pull/309) ([kierenevans](https://github.com/kierenevans))

**Implemented enhancements:**

- Add option for varnish container as the entrypoint to the site in Magento 2.x harness [\#14](https://github.com/inviqa/harness-base-php/issues/14)
- Run phpstan separately for drupal8 [\#325](https://github.com/inviqa/harness-base-php/pull/325) ([kierenevans](https://github.com/kierenevans))
- Improve Xdebug IDE support by not assuming PHPStorm [\#324](https://github.com/inviqa/harness-base-php/pull/324) ([kierenevans](https://github.com/kierenevans))
- Use mutagen by default [\#323](https://github.com/inviqa/harness-base-php/pull/323) ([kierenevans](https://github.com/kierenevans))
- Fix simpletest usage for Drupal 8 [\#322](https://github.com/inviqa/harness-base-php/pull/322) ([kierenevans](https://github.com/kierenevans))
- Speed up Spryker build [\#319](https://github.com/inviqa/harness-base-php/pull/319) ([kierenevans](https://github.com/kierenevans))
- Let production mode work for magento2  [\#318](https://github.com/inviqa/harness-base-php/pull/318) ([kierenevans](https://github.com/kierenevans))
- Allow the Magento2 executable to be called from the host machine [\#316](https://github.com/inviqa/harness-base-php/pull/316) ([jbarton123](https://github.com/jbarton123))
- Enable local mail by default [\#315](https://github.com/inviqa/harness-base-php/pull/315) ([kierenevans](https://github.com/kierenevans))
- Use PHP 7.3 by default in magento2 [\#314](https://github.com/inviqa/harness-base-php/pull/314) ([kierenevans](https://github.com/kierenevans))
- Improve speed of permissions fixes [\#310](https://github.com/inviqa/harness-base-php/pull/310) ([kierenevans](https://github.com/kierenevans))
- Add redis-session persistent storage enabled by default [\#305](https://github.com/inviqa/harness-base-php/pull/305) ([kierenevans](https://github.com/kierenevans))
- Add harness update commands [\#299](https://github.com/inviqa/harness-base-php/pull/299) ([kierenevans](https://github.com/kierenevans))

**Fixed bugs:**

- Remove web writable generated directory for Magento2 [\#320](https://github.com/inviqa/harness-base-php/pull/320) ([jbarton123](https://github.com/jbarton123))
- Fix wrong hosts entry on startup [\#317](https://github.com/inviqa/harness-base-php/pull/317) ([kierenevans](https://github.com/kierenevans))
- Fix drupal8 build [\#311](https://github.com/inviqa/harness-base-php/pull/311) ([kierenevans](https://github.com/kierenevans))
- Align framework overrides with base. Update Magento 2 NGINX config. [\#291](https://github.com/inviqa/harness-base-php/pull/291) ([kierenevans](https://github.com/kierenevans))
- Fix drupal8 phpstan-prophecy path [\#327](https://github.com/inviqa/harness-base-php/pull/327) ([kierenevans](https://github.com/kierenevans))

**Merged pull requests:**

- Bump PHPStan Prophecy based on dependabot upgrading another project [\#321](https://github.com/inviqa/harness-base-php/pull/321) ([kierenevans](https://github.com/kierenevans))
- Bump Magento 1 to 1.14.4.5 [\#313](https://github.com/inviqa/harness-base-php/pull/313) ([kierenevans](https://github.com/kierenevans))
- Bump Magento 2 to 2.3.5-p1 [\#312](https://github.com/inviqa/harness-base-php/pull/312) ([kierenevans](https://github.com/kierenevans))

## [0.7.0](https://github.com/inviqa/harness-base-php/tree/0.7.0) (2020-05-29)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.6.0...0.7.0)

**Breaking changes:**

- Akeneo 4.x Support [\#287](https://github.com/inviqa/harness-base-php/pull/287) ([kierenevans](https://github.com/kierenevans) and [a-ast](https://github.com/a-ast))

**Implemented enhancements:**

- Move RabbitMQ to be available for Magento 2 [\#307](https://github.com/inviqa/harness-base-php/pull/307) ([kierenevans](https://github.com/kierenevans))
- Use less executors at once in Jenkins [\#306](https://github.com/inviqa/harness-base-php/pull/306) ([kierenevans](https://github.com/kierenevans))
- Configure Magento 2 Cron [\#304](https://github.com/inviqa/harness-base-php/pull/304) ([kierenevans](https://github.com/kierenevans))
- Resource Prefix support for Magento 1 & 2 [\#303](https://github.com/inviqa/harness-base-php/pull/303) ([kierenevans](https://github.com/kierenevans))
- Allow automated builds to show us errors [\#301](https://github.com/inviqa/harness-base-php/pull/301) ([kierenevans](https://github.com/kierenevans))
- Indicate that confd\(harness:/\) isn't part of the public api [\#300](https://github.com/inviqa/harness-base-php/pull/300) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Keep generated directory contents on backend init for magento2 [\#297](https://github.com/inviqa/harness-base-php/pull/297) ([jbarton123](https://github.com/jbarton123))
- Add missing php-fpm pool overrides to pool config [\#296](https://github.com/inviqa/harness-base-php/pull/296) ([andytson-inviqa](https://github.com/andytson-inviqa))

**Fixed bugs:**

- Fail init job completely if the first attempt fails [\#302](https://github.com/inviqa/harness-base-php/pull/302) ([kierenevans](https://github.com/kierenevans))
- Fix drupal8 build [\#298](https://github.com/inviqa/harness-base-php/pull/298) ([kierenevans](https://github.com/kierenevans))

## [0.6.0](https://github.com/inviqa/harness-base-php/tree/0.6.0) (2020-05-12)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.5.0...0.6.0)

**Implemented enhancements:**

- Enable production settings for php-fpm in static mode [\#275](https://github.com/inviqa/harness-base-php/issues/275)
- PHP-FPM Pools and Zed [\#271](https://github.com/inviqa/harness-base-php/pull/271) ([g-foster2](https://github.com/g-foster2))
- Adjust README if mutagen is turned on [\#269](https://github.com/inviqa/harness-base-php/pull/269) ([kierenevans](https://github.com/kierenevans))
- Add support for multiple php-fpm pools and split spryker zed into one [\#267](https://github.com/inviqa/harness-base-php/pull/267) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Allow using a fixed mysql port forward to the host [\#290](https://github.com/inviqa/harness-base-php/pull/290) ([kierenevans](https://github.com/kierenevans))
- Prompt for magento edition when creating [\#289](https://github.com/inviqa/harness-base-php/pull/289) ([kierenevans](https://github.com/kierenevans))
- Adding helper commands for composer \(base php\) and drush \(drupal 8\) [\#286](https://github.com/inviqa/harness-base-php/pull/286) ([sawtell](https://github.com/sawtell))
- Add PHP Compatibility Sniffs by default, to aid with version changes [\#285](https://github.com/inviqa/harness-base-php/pull/285) ([kierenevans](https://github.com/kierenevans))
- Updating welcome task to be compiled from twig template. [\#282](https://github.com/inviqa/harness-base-php/pull/282) ([sawtell](https://github.com/sawtell))
- Production PHP Settings [\#280](https://github.com/inviqa/harness-base-php/pull/280) ([kierenevans](https://github.com/kierenevans))
- Updating application template to support hostname aliases [\#279](https://github.com/inviqa/harness-base-php/pull/279) ([sawtell](https://github.com/sawtell))
- Make mysql image and tag configurable [\#278](https://github.com/inviqa/harness-base-php/pull/278) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Run `setup:di:compile` for Magento 2 in static mode [\#274](https://github.com/inviqa/harness-base-php/pull/274) ([kierenevans](https://github.com/kierenevans))
- allow customising annotations on application ingress [\#273](https://github.com/inviqa/harness-base-php/pull/273) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Update magento2 gitignore for 2.3.4 [\#268](https://github.com/inviqa/harness-base-php/pull/268) ([kierenevans](https://github.com/kierenevans))
- Use default Symfony4 web directory [\#266](https://github.com/inviqa/harness-base-php/pull/266) ([NoDiskInDriveA](https://github.com/NoDiskInDriveA))
- Add SensioLabs Behat PageObjectExtension to Magento 2 skeleton [\#264](https://github.com/inviqa/harness-base-php/pull/264) ([tkotosz](https://github.com/tkotosz))

**Fixed bugs:**

- Fix builds for Symfony by adding in a webroot folder [\#277](https://github.com/inviqa/harness-base-php/pull/277) ([kierenevans](https://github.com/kierenevans))
- Add extra cache types to avoid env.php needing to be writable at runtime [\#276](https://github.com/inviqa/harness-base-php/pull/276) ([kierenevans](https://github.com/kierenevans))
- Run the watch script [\#272](https://github.com/inviqa/harness-base-php/pull/272) ([kierenevans](https://github.com/kierenevans))
- Fix dash-casing of php-fpm-exporter services [\#262](https://github.com/inviqa/harness-base-php/pull/262) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Ensure latest drupal/core 8.8.5 is installed. Fix test-quality script [\#292](https://github.com/inviqa/harness-base-php/pull/292) ([kierenevans](https://github.com/kierenevans))
- Ignore cron's env.sh [\#288](https://github.com/inviqa/harness-base-php/pull/288) ([kierenevans](https://github.com/kierenevans))
- Avoid copying assets to php-fpm from console [\#284](https://github.com/inviqa/harness-base-php/pull/284) ([kierenevans](https://github.com/kierenevans))
- Fix TTY usage when stdin is not a TTY. [\#265](https://github.com/inviqa/harness-base-php/pull/265) ([kierenevans](https://github.com/kierenevans))

## [0.5.0](https://github.com/inviqa/harness-base-php/tree/0.5.0) (2020-03-26)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.4.0...0.5.0)

**Implemented enhancements:**

- Add php-fpm status endpoint for php-fpm\_exporter [\#260](https://github.com/inviqa/harness-base-php/pull/260) ([andytson-inviqa](https://github.com/andytson-inviqa))
- lower the revision history limit for k8s deployments [\#258](https://github.com/inviqa/harness-base-php/pull/258) ([dcole-inviqa](https://github.com/dcole-inviqa))
- enable persistent storage for preview environments [\#257](https://github.com/inviqa/harness-base-php/pull/257) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Move console.enabled to services for attribute override capability [\#256](https://github.com/inviqa/harness-base-php/pull/256) ([andytson-inviqa](https://github.com/andytson-inviqa))
- initial support for magento2 pipeline deployment [\#253](https://github.com/inviqa/harness-base-php/pull/253) ([dcole-inviqa](https://github.com/dcole-inviqa))
- provide default values for production environment [\#252](https://github.com/inviqa/harness-base-php/pull/252) ([dcole-inviqa](https://github.com/dcole-inviqa))
- provide default values for preview environments [\#251](https://github.com/inviqa/harness-base-php/pull/251) ([dcole-inviqa](https://github.com/dcole-inviqa))
- make console pod optional in app helm chart [\#250](https://github.com/inviqa/harness-base-php/pull/250) ([dcole-inviqa](https://github.com/dcole-inviqa))
- initial work to make app helm chart argocd compatible [\#248](https://github.com/inviqa/harness-base-php/pull/248) ([dcole-inviqa](https://github.com/dcole-inviqa))
- allow publishing app helm chart to a git repository [\#247](https://github.com/inviqa/harness-base-php/pull/247) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Add prometheus operator podmonitoring [\#246](https://github.com/inviqa/harness-base-php/pull/246) ([andytson-inviqa](https://github.com/andytson-inviqa))

**Fixed bugs:**

- Always use prod mode to avoid issues in interpolating env var [\#259](https://github.com/inviqa/harness-base-php/pull/259) ([g-foster2](https://github.com/g-foster2))

**Deprecated:**

- Remove unused php-fpm-exporter service [\#255](https://github.com/inviqa/harness-base-php/pull/255) ([andytson-inviqa](https://github.com/andytson-inviqa))

## [0.4.0](https://github.com/inviqa/harness-base-php/tree/0.4.0) (2020-03-18)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.3.14...0.4.0)

**Implemented enhancements:**

- Use passthru for helm kubeval [\#225](https://github.com/inviqa/harness-base-php/pull/225) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add php-fpm-exporter to provide a prometheus endpoint [\#223](https://github.com/inviqa/harness-base-php/pull/223) ([g-foster2](https://github.com/g-foster2))
- Trace of what happens during `ws enable` [\#236](https://github.com/inviqa/harness-base-php/pull/236) ([kierenevans](https://github.com/kierenevans))
- Ignore mutagen.yml in gitignore [\#233](https://github.com/inviqa/harness-base-php/pull/233) ([kierenevans](https://github.com/kierenevans))
- Run composer tests in static build [\#232](https://github.com/inviqa/harness-base-php/pull/232) ([kierenevans](https://github.com/kierenevans))
- Add package namespace to all composer skeleton files [\#231](https://github.com/inviqa/harness-base-php/pull/231) ([kierenevans](https://github.com/kierenevans))
- Memory requests equal limits [\#218](https://github.com/inviqa/harness-base-php/pull/218) ([kierenevans](https://github.com/kierenevans))
- Add mutagen sync [\#215](https://github.com/inviqa/harness-base-php/pull/215) ([hgajjar](https://github.com/hgajjar))
- Allow updating the docker-compose file version [\#212](https://github.com/inviqa/harness-base-php/pull/212) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add PHP syntax checking to code quality testing [\#179](https://github.com/inviqa/harness-base-php/pull/179) ([elvetemedve](https://github.com/elvetemedve))
- Bump to Magento 2.3.4 [\#157](https://github.com/inviqa/harness-base-php/pull/157) ([kierenevans](https://github.com/kierenevans))

**Fixed bugs:**

- Fix akeneo production mode [\#229](https://github.com/inviqa/harness-base-php/pull/229) ([g-foster2](https://github.com/g-foster2))
- Cronjob for tests on 0.4.x branch [\#224](https://github.com/inviqa/harness-base-php/pull/224) ([kierenevans](https://github.com/kierenevans))
- add backend volume mount to init and migrate pod specs [\#242](https://github.com/inviqa/harness-base-php/pull/242) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Disable k8s service links [\#240](https://github.com/inviqa/harness-base-php/pull/240) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Fix mutagen file permissions sync to host [\#239](https://github.com/inviqa/harness-base-php/pull/239) ([kierenevans](https://github.com/kierenevans))
- Fix `ws docker-sync stop` removing sync container [\#237](https://github.com/inviqa/harness-base-php/pull/237) ([kierenevans](https://github.com/kierenevans))
- Anchor mutagen ignore paths at project root [\#235](https://github.com/inviqa/harness-base-php/pull/235) ([kierenevans](https://github.com/kierenevans))
- Treat non-relative symlinks as raw in mutagen [\#234](https://github.com/inviqa/harness-base-php/pull/234) ([kierenevans](https://github.com/kierenevans))

**Security fixes:**

- Hide docker login password from workspace output [\#228](https://github.com/inviqa/harness-base-php/pull/228) ([andytson-inviqa](https://github.com/andytson-inviqa))

## [0.3.14](https://github.com/inviqa/harness-base-php/tree/0.3.14) (2020-03-17)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.3.13...0.3.14)

**Fixed bugs:**

- Remove ports and readinessProbe from cron deployment [\#220](https://github.com/inviqa/harness-base-php/pull/220) ([andytson-inviqa](https://github.com/andytson-inviqa))

## [0.3.13](https://github.com/inviqa/harness-base-php/tree/0.3.13) (2020-02-24)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.3.12...0.3.13)

**Merged pull requests:**

- Akeneo app mode \(and some fixes\) [\#219](https://github.com/inviqa/harness-base-php/pull/219) ([g-foster2](https://github.com/g-foster2))
- Add kubeval for linting the rendered helm templates against schema [\#217](https://github.com/inviqa/harness-base-php/pull/217) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Allow overriding of istio virtualservice gateway with template support [\#216](https://github.com/inviqa/harness-base-php/pull/216) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Update check for docker containers exiting based on mode [\#214](https://github.com/inviqa/harness-base-php/pull/214) ([kierenevans](https://github.com/kierenevans))
- Add Symfony Harness Skeleton [\#209](https://github.com/inviqa/harness-base-php/pull/209) ([kierenevans](https://github.com/kierenevans))

## [0.3.12](https://github.com/inviqa/harness-base-php/tree/0.3.12) (2020-02-13)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.3.11...0.3.12)

**Merged pull requests:**

- Fix so that cron script works with all commands [\#213](https://github.com/inviqa/harness-base-php/pull/213) ([g-foster2](https://github.com/g-foster2))

## [0.3.11](https://github.com/inviqa/harness-base-php/tree/0.3.11) (2020-02-12)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.3.10...0.3.11)

## [0.3.10](https://github.com/inviqa/harness-base-php/tree/0.3.10) (2020-02-12)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.3.9...0.3.10)

**Merged pull requests:**

- Fix cron script to work with php commands + Spryker timeout issue + Build fixes/improvements [\#211](https://github.com/inviqa/harness-base-php/pull/211) ([g-foster2](https://github.com/g-foster2))

## [0.3.9](https://github.com/inviqa/harness-base-php/tree/0.3.9) (2020-02-10)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.3.8...0.3.9)

**Merged pull requests:**

- Add cron container, with it enabled for Akeneo  [\#210](https://github.com/inviqa/harness-base-php/pull/210) ([g-foster2](https://github.com/g-foster2))
- Build base to check if it's working [\#208](https://github.com/inviqa/harness-base-php/pull/208) ([kierenevans](https://github.com/kierenevans))

## [0.3.8](https://github.com/inviqa/harness-base-php/tree/0.3.8) (2020-01-29)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.3.7...0.3.8)

**Merged pull requests:**

- akeneo helm values file in wrong location [\#207](https://github.com/inviqa/harness-base-php/pull/207) ([g-foster2](https://github.com/g-foster2))

## [0.3.7](https://github.com/inviqa/harness-base-php/tree/0.3.7) (2020-01-28)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.3.4...0.3.7)

**Merged pull requests:**

- Akeneo - split job-queue-consumer from php fpm container [\#206](https://github.com/inviqa/harness-base-php/pull/206) ([g-foster2](https://github.com/g-foster2))
- Support use of specific mode in akeneo commands [\#204](https://github.com/inviqa/harness-base-php/pull/204) ([g-foster2](https://github.com/g-foster2))
- MISC Pass script arguments into function for further use [\#203](https://github.com/inviqa/harness-base-php/pull/203) ([g-foster2](https://github.com/g-foster2))
- MISC Add the default sleep command to jenkins-runner [\#202](https://github.com/inviqa/harness-base-php/pull/202) ([andytson-inviqa](https://github.com/andytson-inviqa))

## [0.3.4](https://github.com/inviqa/harness-base-php/tree/0.3.4) (2020-01-13)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.3.2...0.3.4)

**Merged pull requests:**

- Allow additional istio gateways to be specified [\#201](https://github.com/inviqa/harness-base-php/pull/201) ([g-foster2](https://github.com/g-foster2))
- Add database import command and steps configured in harness.yml [\#200](https://github.com/inviqa/harness-base-php/pull/200) ([g-foster2](https://github.com/g-foster2))
- MISC: Dont use -T flag if tty is available [\#199](https://github.com/inviqa/harness-base-php/pull/199) ([hgajjar](https://github.com/hgajjar))
- Use locks and milestones in Jenkinsfile for reducing concurrency and … [\#198](https://github.com/inviqa/harness-base-php/pull/198) ([andytson-inviqa](https://github.com/andytson-inviqa))
- MISC Use admin mysql user/pass var naming [\#197](https://github.com/inviqa/harness-base-php/pull/197) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add mysqladmin connect timeout [\#196](https://github.com/inviqa/harness-base-php/pull/196) ([bennoislost](https://github.com/bennoislost))
- Pass MySQL server variables [\#193](https://github.com/inviqa/harness-base-php/pull/193) ([bennoislost](https://github.com/bennoislost))
- Make entrypoint.sh a true entrypoint and use sleep infinity [\#175](https://github.com/inviqa/harness-base-php/pull/175) ([andytson-inviqa](https://github.com/andytson-inviqa))

## [0.3.2](https://github.com/inviqa/harness-base-php/tree/0.3.2) (2019-12-12)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.3.1...0.3.2)

**Merged pull requests:**

- \[DEVOPS-1119\] fix for spryker build and deployment [\#195](https://github.com/inviqa/harness-base-php/pull/195) ([g-foster2](https://github.com/g-foster2))
- Silence the network ls in ws networks external [\#194](https://github.com/inviqa/harness-base-php/pull/194) ([andytson-inviqa](https://github.com/andytson-inviqa))
- \[DEVOPS-1118\] update to fix issues in building and deploying akeneo [\#192](https://github.com/inviqa/harness-base-php/pull/192) ([g-foster2](https://github.com/g-foster2))
- Add volumes to spryker jenkins-runner pod/container [\#191](https://github.com/inviqa/harness-base-php/pull/191) ([andytson-inviqa](https://github.com/andytson-inviqa))

## [0.3.1](https://github.com/inviqa/harness-base-php/tree/0.3.1) (2019-12-05)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.3.0...0.3.1)

**Merged pull requests:**

- MISC fix usage of tpl missing from some helm containers [\#190](https://github.com/inviqa/harness-base-php/pull/190) ([andytson-inviqa](https://github.com/andytson-inviqa))

## [0.3.0](https://github.com/inviqa/harness-base-php/tree/0.3.0) (2019-12-03)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.2.7...0.3.0)

**Closed issues:**

- Dynamic twig functions should be able to return any type, but is forced to be string [\#168](https://github.com/inviqa/harness-base-php/issues/168)
- Add ws assets sync command [\#164](https://github.com/inviqa/harness-base-php/issues/164)
- Update Nginx to latest version [\#144](https://github.com/inviqa/harness-base-php/issues/144)

**Merged pull requests:**

- \[DEVOPS-1115\] just the build changes [\#188](https://github.com/inviqa/harness-base-php/pull/188) ([g-foster2](https://github.com/g-foster2))
- Fix issue with renamed pvc names not reflected in their volume mount [\#187](https://github.com/inviqa/harness-base-php/pull/187) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Merge the nginx and php-fpm deployments together as a webapp pod [\#185](https://github.com/inviqa/harness-base-php/pull/185) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Move akeneo config\_renderer to base harness so all harnesses use it [\#184](https://github.com/inviqa/harness-base-php/pull/184) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Allow the pvc name to be overridden in projects with tpl support [\#183](https://github.com/inviqa/harness-base-php/pull/183) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Tell istio proxy to quit once k8s job is finished [\#182](https://github.com/inviqa/harness-base-php/pull/182) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Render helm prefix value at helm rendering time rather than twig [\#181](https://github.com/inviqa/harness-base-php/pull/181) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix SIMPLETEST\_DB using uri Drupal can parse [\#180](https://github.com/inviqa/harness-base-php/pull/180) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Do not autoload dev classes in production mode [\#177](https://github.com/inviqa/harness-base-php/pull/177) ([elvetemedve](https://github.com/elvetemedve))
- \[DEVOPS-1114\] merge back harness overrides [\#176](https://github.com/inviqa/harness-base-php/pull/176) ([g-foster2](https://github.com/g-foster2))
- Add a way to ensure external networks exist prior to enabling [\#174](https://github.com/inviqa/harness-base-php/pull/174) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Drupal Harness Update [\#172](https://github.com/inviqa/harness-base-php/pull/172) ([sgrichards](https://github.com/sgrichards))
- Support overriding helm environment variables via attributes [\#170](https://github.com/inviqa/harness-base-php/pull/170) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix regression bugs in helm and verify rendering [\#169](https://github.com/inviqa/harness-base-php/pull/169) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Make resource prefix configurable, named more accurately [\#167](https://github.com/inviqa/harness-base-php/pull/167) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix docker-sync install in spryker harness. [\#166](https://github.com/inviqa/harness-base-php/pull/166) ([kierenevans](https://github.com/kierenevans))
- Add ps command [\#165](https://github.com/inviqa/harness-base-php/pull/165) ([tkotosz](https://github.com/tkotosz))
- Add logs command [\#163](https://github.com/inviqa/harness-base-php/pull/163) ([tkotosz](https://github.com/tkotosz))
- Fix db console command name [\#162](https://github.com/inviqa/harness-base-php/pull/162) ([tkotosz](https://github.com/tkotosz))
- Add ability to set up persistent volumes for the application [\#161](https://github.com/inviqa/harness-base-php/pull/161) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add optional prefix to k8s resources [\#159](https://github.com/inviqa/harness-base-php/pull/159) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Copy only the web/public directory into Nginx when built in static mode [\#156](https://github.com/inviqa/harness-base-php/pull/156) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Istio ingress support [\#155](https://github.com/inviqa/harness-base-php/pull/155) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Bump jquery from 3.3.1 to 3.4.1 in /src/akeneo/application/skeleton [\#154](https://github.com/inviqa/harness-base-php/pull/154) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump lodash from 4.17.11 to 4.17.15 in /src/akeneo/application/skeleton [\#153](https://github.com/inviqa/harness-base-php/pull/153) ([dependabot[bot]](https://github.com/apps/dependabot))
- Add Istio ingress support [\#152](https://github.com/inviqa/harness-base-php/pull/152) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Build master branch \(0.2.x\) daily [\#151](https://github.com/inviqa/harness-base-php/pull/151) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Update helm for m1/m2 to support k8s environments [\#150](https://github.com/inviqa/harness-base-php/pull/150) ([andytson-inviqa](https://github.com/andytson-inviqa))
- MISC fix redis-session label selector [\#149](https://github.com/inviqa/harness-base-php/pull/149) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Move docker service environment variable definitions to attributes [\#148](https://github.com/inviqa/harness-base-php/pull/148) ([andytson-inviqa](https://github.com/andytson-inviqa))
- v4.3.4 of symfony breaks spryker [\#147](https://github.com/inviqa/harness-base-php/pull/147) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Add PHP Harness yml [\#146](https://github.com/inviqa/harness-base-php/pull/146) ([kierenevans](https://github.com/kierenevans))
- \#144 Update Nginx to 1.17 [\#145](https://github.com/inviqa/harness-base-php/pull/145) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Always pull when building images in CI [\#142](https://github.com/inviqa/harness-base-php/pull/142) ([kierenevans](https://github.com/kierenevans))
- Spryker jenkins improvements [\#141](https://github.com/inviqa/harness-base-php/pull/141) ([hgajjar](https://github.com/hgajjar))
- Use atomic helm upgrades to rollback automatically in case of upgrade failure. [\#126](https://github.com/inviqa/harness-base-php/pull/126) ([kierenevans](https://github.com/kierenevans))
- Support the use of no database and reduce templating around it [\#73](https://github.com/inviqa/harness-base-php/pull/73) ([andytson-inviqa](https://github.com/andytson-inviqa))

## [0.2.7](https://github.com/inviqa/harness-base-php/tree/0.2.7) (2019-07-16)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.2.6...0.2.7)

**Implemented enhancements:**

- add elasticsearch to the list of available services [\#59](https://github.com/inviqa/harness-base-php/issues/59)
- www-data should not own every file [\#57](https://github.com/inviqa/harness-base-php/issues/57)

**Merged pull requests:**

- Add memory limits for k8s resources [\#140](https://github.com/inviqa/harness-base-php/pull/140) ([hgajjar](https://github.com/hgajjar))
- Add pvc only if service is enabled [\#139](https://github.com/inviqa/harness-base-php/pull/139) ([hgajjar](https://github.com/hgajjar))
- Add mailhog configuration for pipeline environments [\#138](https://github.com/inviqa/harness-base-php/pull/138) ([hgajjar](https://github.com/hgajjar))
- Improve harness READMEs [\#136](https://github.com/inviqa/harness-base-php/pull/136) ([kierenevans](https://github.com/kierenevans))
- Ignore docker-sync directory [\#135](https://github.com/inviqa/harness-base-php/pull/135) ([kierenevans](https://github.com/kierenevans))
- Remove --no-ri and --no-rdoc arguments as they have been removed in `gem` v3 [\#134](https://github.com/inviqa/harness-base-php/pull/134) ([kierenevans](https://github.com/kierenevans))
- Akeneo harness [\#133](https://github.com/inviqa/harness-base-php/pull/133) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Use PHP 7.2 for Magento 2 as 7.1 is EOL in December 2019 [\#132](https://github.com/inviqa/harness-base-php/pull/132) ([kierenevans](https://github.com/kierenevans))
- Upgrade Magento 1.14.4.1 to 1.14.4.2 [\#131](https://github.com/inviqa/harness-base-php/pull/131) ([kierenevans](https://github.com/kierenevans))
- Upgrade Magento 2.3.1 to 2.3.2 [\#130](https://github.com/inviqa/harness-base-php/pull/130) ([kierenevans](https://github.com/kierenevans))
- Allow running commands at php-fpm entrypoint [\#129](https://github.com/inviqa/harness-base-php/pull/129) ([hgajjar](https://github.com/hgajjar))
- Clarify that a new blank file is needed for workspace.override.yml [\#128](https://github.com/inviqa/harness-base-php/pull/128) ([kierenevans](https://github.com/kierenevans))
- Elasticsearch service [\#127](https://github.com/inviqa/harness-base-php/pull/127) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Make Jenkins credential name for the workspace key configurable [\#124](https://github.com/inviqa/harness-base-php/pull/124) ([andytson-inviqa](https://github.com/andytson-inviqa))

## [0.2.6](https://github.com/inviqa/harness-base-php/tree/0.2.6) (2019-06-20)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.2.4...0.2.6)

**Closed issues:**

- Release the \_base harness so new frameworks can be prototyped prior to conversion to a harness [\#93](https://github.com/inviqa/harness-base-php/issues/93)

**Merged pull requests:**

- Add PVC for MySQL service [\#125](https://github.com/inviqa/harness-base-php/pull/125) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Initial approach for deploying to DO k8s [\#123](https://github.com/inviqa/harness-base-php/pull/123) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Spryker helm charts [\#122](https://github.com/inviqa/harness-base-php/pull/122) ([hgajjar](https://github.com/hgajjar))
- Add post-upgrade-hook to call the app migrate task [\#121](https://github.com/inviqa/harness-base-php/pull/121) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Add migrate task to facilitate deployments [\#120](https://github.com/inviqa/harness-base-php/pull/120) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Add helm hook to init the app [\#119](https://github.com/inviqa/harness-base-php/pull/119) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Fix command used to build helm dependencies [\#118](https://github.com/inviqa/harness-base-php/pull/118) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Add support for setting global configuration in nginx [\#117](https://github.com/inviqa/harness-base-php/pull/117) ([hgajjar](https://github.com/hgajjar))
- Pull from private registries in Helm [\#116](https://github.com/inviqa/harness-base-php/pull/116) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Refactoring of helm chart and pipeline config [\#115](https://github.com/inviqa/harness-base-php/pull/115) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Disable D8 asset aggregation in static builds [\#114](https://github.com/inviqa/harness-base-php/pull/114) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Add Spryker frontend watch commands [\#113](https://github.com/inviqa/harness-base-php/pull/113) ([hgajjar](https://github.com/hgajjar))
- Add D8 specific environment to helm preview chart [\#112](https://github.com/inviqa/harness-base-php/pull/112) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Set default imagePullPolicy of Always [\#111](https://github.com/inviqa/harness-base-php/pull/111) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Refactor feature toggling [\#108](https://github.com/inviqa/harness-base-php/pull/108) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Fix phpstan include with docker-sync [\#106](https://github.com/inviqa/harness-base-php/pull/106) ([kierenevans](https://github.com/kierenevans))
- Port run code mappings from Magento 1 to Magento 2 harness [\#105](https://github.com/inviqa/harness-base-php/pull/105) ([kierenevans](https://github.com/kierenevans))
- Fix passthru commands that have quotes. [\#104](https://github.com/inviqa/harness-base-php/pull/104) ([kierenevans](https://github.com/kierenevans))
- Add setting toggle commands [\#103](https://github.com/inviqa/harness-base-php/pull/103) ([kierenevans](https://github.com/kierenevans))
- Install docker-sync if needed [\#102](https://github.com/inviqa/harness-base-php/pull/102) ([kierenevans](https://github.com/kierenevans))
- Set a default PHP\_IDE\_CONFIG for CLI Xdebug [\#101](https://github.com/inviqa/harness-base-php/pull/101) ([kierenevans](https://github.com/kierenevans))
- Allow the base to be deployed as a standalone harness [\#99](https://github.com/inviqa/harness-base-php/pull/99) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Spryker: fix URL issue for pipeline environments [\#98](https://github.com/inviqa/harness-base-php/pull/98) ([hgajjar](https://github.com/hgajjar))
- Cycle secrets [\#97](https://github.com/inviqa/harness-base-php/pull/97) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Issue-57: root to own app data [\#96](https://github.com/inviqa/harness-base-php/pull/96) ([marcomc](https://github.com/marcomc))
- Set default redis "save" configuration [\#95](https://github.com/inviqa/harness-base-php/pull/95) ([hgajjar](https://github.com/hgajjar))
- Spryker mail configuration [\#94](https://github.com/inviqa/harness-base-php/pull/94) ([hgajjar](https://github.com/hgajjar))
- Add missing postgres dump commands [\#92](https://github.com/inviqa/harness-base-php/pull/92) ([hgajjar](https://github.com/hgajjar))
- Disable behat in spryker [\#91](https://github.com/inviqa/harness-base-php/pull/91) ([dcole-inviqa](https://github.com/dcole-inviqa))
- initial base helm charts [\#75](https://github.com/inviqa/harness-base-php/pull/75) ([dcole-inviqa](https://github.com/dcole-inviqa))

## [0.2.4](https://github.com/inviqa/harness-base-php/tree/0.2.4) (2019-05-20)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.2.2...0.2.4)

**Implemented enhancements:**

- Dump drupal media assets [\#62](https://github.com/inviqa/harness-base-php/issues/62)
- Turn off TLS v1.0 [\#49](https://github.com/inviqa/harness-base-php/issues/49)
- Add customisable nginx config for client\_max\_body\_size etc [\#48](https://github.com/inviqa/harness-base-php/issues/48)
- Add shellcheck to catch common errors [\#39](https://github.com/inviqa/harness-base-php/issues/39)
- Switch from my127/behat-chrome-extension to dmore/behat-chrome-extension [\#32](https://github.com/inviqa/harness-base-php/issues/32)
- Review and fix the quality, unit and acceptance tests for the WP harness [\#28](https://github.com/inviqa/harness-base-php/issues/28)
- Create MVP Helm chart for M2 [\#18](https://github.com/inviqa/harness-base-php/issues/18)
- Create an environment for Spryker [\#17](https://github.com/inviqa/harness-base-php/issues/17)
- Add ability to set Magento 1's admin URL in local.xml [\#11](https://github.com/inviqa/harness-base-php/issues/11)
- Add ability to set Magento 1's store settings [\#10](https://github.com/inviqa/harness-base-php/issues/10)
- Add ability to set Magento 1's local.xml "environment" [\#9](https://github.com/inviqa/harness-base-php/issues/9)
- Allow PHP config to change without rebuilding the environment [\#8](https://github.com/inviqa/harness-base-php/issues/8)
- Remove settings.php from overlay and add to skeleton, settings.local.… [\#65](https://github.com/inviqa/harness-base-php/pull/65) ([sgrichards](https://github.com/sgrichards))
- Add phpstan with extension for Magento 1 to magento1 harness [\#60](https://github.com/inviqa/harness-base-php/pull/60) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Drupal phpstan setup [\#55](https://github.com/inviqa/harness-base-php/pull/55) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Make docker-compose more accessible for local development [\#38](https://github.com/inviqa/harness-base-php/pull/38) ([dcole-inviqa](https://github.com/dcole-inviqa))

**Fixed bugs:**

- Drush connecting to database as root [\#83](https://github.com/inviqa/harness-base-php/issues/83)
- X Frame Deny stops drupal inline entities loading [\#50](https://github.com/inviqa/harness-base-php/issues/50)
- ws install leaves an empty `1` file after completion [\#36](https://github.com/inviqa/harness-base-php/issues/36)

**Merged pull requests:**

- Add missing gitignore entries [\#90](https://github.com/inviqa/harness-base-php/pull/90) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Combine Jenkins parallel steps [\#89](https://github.com/inviqa/harness-base-php/pull/89) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Spryker behat integration [\#88](https://github.com/inviqa/harness-base-php/pull/88) ([hgajjar](https://github.com/hgajjar))
- Spryker - fix rabbitmq configuration [\#87](https://github.com/inviqa/harness-base-php/pull/87) ([hgajjar](https://github.com/hgajjar))
- Spryker glue api config [\#86](https://github.com/inviqa/harness-base-php/pull/86) ([hgajjar](https://github.com/hgajjar))
- Use Jenkins to build and test environments [\#85](https://github.com/inviqa/harness-base-php/pull/85) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Set mysql root password in .my.cnf [\#81](https://github.com/inviqa/harness-base-php/pull/81) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Support php config change without env rebuild [\#80](https://github.com/inviqa/harness-base-php/pull/80) ([hgajjar](https://github.com/hgajjar))
- Support custom composer.json for Spryker harness [\#77](https://github.com/inviqa/harness-base-php/pull/77) ([hgajjar](https://github.com/hgajjar))
- Fix Jenkins cron syntax - can't span midnight [\#76](https://github.com/inviqa/harness-base-php/pull/76) ([kierenevans](https://github.com/kierenevans))
- Add a daily Jenkins build for the main branch \(stopping after tests\) [\#74](https://github.com/inviqa/harness-base-php/pull/74) ([kierenevans](https://github.com/kierenevans))
- remove harness override from spryker [\#71](https://github.com/inviqa/harness-base-php/pull/71) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Fix drupal build [\#70](https://github.com/inviqa/harness-base-php/pull/70) ([hgajjar](https://github.com/hgajjar))
- Ensure we clean up static images even if an image is tagged to multiple tags [\#69](https://github.com/inviqa/harness-base-php/pull/69) ([kierenevans](https://github.com/kierenevans))
- Add project skeleton README for reference [\#68](https://github.com/inviqa/harness-base-php/pull/68) ([kierenevans](https://github.com/kierenevans))
- Add phpstan to magento2 harness [\#66](https://github.com/inviqa/harness-base-php/pull/66) ([andytson-inviqa](https://github.com/andytson-inviqa))
- drupal dump media [\#64](https://github.com/inviqa/harness-base-php/pull/64) ([mcurran-inviqa](https://github.com/mcurran-inviqa))
- Spryker harness [\#63](https://github.com/inviqa/harness-base-php/pull/63) ([hgajjar](https://github.com/hgajjar))
- Progressbar for database imports [\#61](https://github.com/inviqa/harness-base-php/pull/61) ([kierenevans](https://github.com/kierenevans))
- 10 mage run code [\#58](https://github.com/inviqa/harness-base-php/pull/58) ([mcurran-inviqa](https://github.com/mcurran-inviqa))
- 28 wp tests [\#56](https://github.com/inviqa/harness-base-php/pull/56) ([mcurran-inviqa](https://github.com/mcurran-inviqa))
- 50 leave x frame to be dictated by the original project [\#54](https://github.com/inviqa/harness-base-php/pull/54) ([mcurran-inviqa](https://github.com/mcurran-inviqa))
- 49 disable tls v1 [\#53](https://github.com/inviqa/harness-base-php/pull/53) ([mcurran-inviqa](https://github.com/mcurran-inviqa))
- 11 allow specify m1 admin [\#52](https://github.com/inviqa/harness-base-php/pull/52) ([mcurran-inviqa](https://github.com/mcurran-inviqa))
- 48 nginx vars [\#51](https://github.com/inviqa/harness-base-php/pull/51) ([mcurran-inviqa](https://github.com/mcurran-inviqa))
- Add shellcheck to fix common errors [\#47](https://github.com/inviqa/harness-base-php/pull/47) ([hgajjar](https://github.com/hgajjar))
- 32 behat chrome [\#46](https://github.com/inviqa/harness-base-php/pull/46) ([mcurran-inviqa](https://github.com/mcurran-inviqa))
- Fix shell script which leaves empty file after ws install [\#44](https://github.com/inviqa/harness-base-php/pull/44) ([hgajjar](https://github.com/hgajjar))
- Add basic helm chart for m2 [\#35](https://github.com/inviqa/harness-base-php/pull/35) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Add pipeline helper functions and commands [\#34](https://github.com/inviqa/harness-base-php/pull/34) ([dcole-inviqa](https://github.com/dcole-inviqa))
- use the same composer install command regardless of app mode [\#33](https://github.com/inviqa/harness-base-php/pull/33) ([dcole-inviqa](https://github.com/dcole-inviqa))

## [0.2.2](https://github.com/inviqa/harness-base-php/tree/0.2.2) (2019-04-01)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/77900845f2821a86f3f1d11ebb1696eacfd83675...0.2.2)

**Implemented enhancements:**

- make docker-compose.yml.twig more versatile [\#2](https://github.com/inviqa/harness-base-php/issues/2)

**Closed issues:**

- Get basic unit and acceptance test suite working in D8 [\#19](https://github.com/inviqa/harness-base-php/issues/19)

**Merged pull requests:**

- Set unlimited memory for PHP CLI, overriding the default of 128MB [\#31](https://github.com/inviqa/harness-base-php/pull/31) ([kierenevans](https://github.com/kierenevans))
- Fix php warning due to php.ini having \# for comments [\#30](https://github.com/inviqa/harness-base-php/pull/30) ([kierenevans](https://github.com/kierenevans))
- Fix merging of docker-compose.override.yml [\#29](https://github.com/inviqa/harness-base-php/pull/29) ([kierenevans](https://github.com/kierenevans))
- run the per harness quality, unit and acceptance tests [\#27](https://github.com/inviqa/harness-base-php/pull/27) ([dcole-inviqa](https://github.com/dcole-inviqa))
- add basic mvp jenkinsfile for app build and test [\#26](https://github.com/inviqa/harness-base-php/pull/26) ([dcole-inviqa](https://github.com/dcole-inviqa))
- cleanup docker images when destroying a static build [\#25](https://github.com/inviqa/harness-base-php/pull/25) ([dcole-inviqa](https://github.com/dcole-inviqa))
- Bump Magento 1 version to 1.14.4.1 [\#24](https://github.com/inviqa/harness-base-php/pull/24) ([kierenevans](https://github.com/kierenevans))
- Bump Magento to 2.3.1 [\#23](https://github.com/inviqa/harness-base-php/pull/23) ([kierenevans](https://github.com/kierenevans))
- respect exit codes for exec [\#22](https://github.com/inviqa/harness-base-php/pull/22) ([dcole-inviqa](https://github.com/dcole-inviqa))
- fix drupal test suite [\#20](https://github.com/inviqa/harness-base-php/pull/20) ([mcurran-inviqa](https://github.com/mcurran-inviqa))
- Parallel builds in travis [\#7](https://github.com/inviqa/harness-base-php/pull/7) ([dcole-inviqa](https://github.com/dcole-inviqa))
- More PHP ini settings - loop over settings in the template [\#6](https://github.com/inviqa/harness-base-php/pull/6) ([kierenevans](https://github.com/kierenevans))
- Refactoring of docker-compose.yml [\#5](https://github.com/inviqa/harness-base-php/pull/5) ([dcole-inviqa](https://github.com/dcole-inviqa))
- simplify networking [\#4](https://github.com/inviqa/harness-base-php/pull/4) ([dcole-inviqa](https://github.com/dcole-inviqa))
- fixing static builds [\#3](https://github.com/inviqa/harness-base-php/pull/3) ([dcole-inviqa](https://github.com/dcole-inviqa))
- access mysql service from host machine [\#1](https://github.com/inviqa/harness-base-php/pull/1) ([dcole-inviqa](https://github.com/dcole-inviqa))



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*

# Changelog

## [1.3.0](https://github.com/inviqa/harness-base-php/tree/1.3.0) (2022-04-12)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/1.2.2...1.3.0)

**Implemented enhancements:**

- Update k8s Ingress to v1 and add optional ingressClassName [\#675](https://github.com/inviqa/harness-base-php/pull/675) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Allow specifying k8s context on sealed-secret commands [\#674](https://github.com/inviqa/harness-base-php/pull/674) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add spryker refresh command [\#668](https://github.com/inviqa/harness-base-php/pull/668) ([michaeltrestianu18](https://github.com/michaeltrestianu18))
- Ensure pipeline environments generate new admin passwords [\#667](https://github.com/inviqa/harness-base-php/pull/667) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Move phpstan configs to skeleton [\#664](https://github.com/inviqa/harness-base-php/pull/664) ([hgajjar](https://github.com/hgajjar))
- Switch kubeval's k8s spec location to fork [\#662](https://github.com/inviqa/harness-base-php/pull/662) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Document that need to downgrade database.platform\_version too [\#660](https://github.com/inviqa/harness-base-php/pull/660) ([kierenevans](https://github.com/kierenevans))
- Allow defining replicas from attributes for application deployments, … [\#658](https://github.com/inviqa/harness-base-php/pull/658) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add horizontal pod autoscaler and pod disruption budgets [\#656](https://github.com/inviqa/harness-base-php/pull/656) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add Spryker 202108.0 support [\#655](https://github.com/inviqa/harness-base-php/pull/655) ([hgajjar](https://github.com/hgajjar))

**Fixed bugs:**

- Fix Spryker customer login [\#672](https://github.com/inviqa/harness-base-php/pull/672) ([hgajjar](https://github.com/hgajjar))
- Fix wrong platform mysql image on arm64 with new mysql:8.0-oracle image [\#671](https://github.com/inviqa/harness-base-php/pull/671) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix issue with flex, with Symfony upgrade to 5.4 and sync-recipes on init [\#670](https://github.com/inviqa/harness-base-php/pull/670) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Use elasticsearch user instead of root [\#669](https://github.com/inviqa/harness-base-php/pull/669) ([hgajjar](https://github.com/hgajjar))
- Fix lighthouse result forwarding [\#663](https://github.com/inviqa/harness-base-php/pull/663) ([hgajjar](https://github.com/hgajjar))
- Update elasticsearch for another log4j CVE [\#661](https://github.com/inviqa/harness-base-php/pull/661) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix issue with php service sub dicts copying into php-base [\#659](https://github.com/inviqa/harness-base-php/pull/659) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix formatting of pdb and hpa templates [\#657](https://github.com/inviqa/harness-base-php/pull/657) ([andytson-inviqa](https://github.com/andytson-inviqa))

**Closed issues:**

- Spryker - add support for 202108.0 release [\#654](https://github.com/inviqa/harness-base-php/issues/654)

## [1.2.2](https://github.com/inviqa/harness-base-php/tree/1.2.2) (2022-01-10)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/1.2.1...1.2.2)

**Fixed bugs:**

- Upgrade all elasticsearch versions to latest versions [\#653](https://github.com/inviqa/harness-base-php/pull/653) ([andytson-inviqa](https://github.com/andytson-inviqa))

## [1.2.1](https://github.com/inviqa/harness-base-php/tree/1.2.1) (2021-12-16)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/1.2.0...1.2.1)

**Fixed bugs:**

- Add quotes on mysql.tag and other tags to avoid losing x.0 to x [\#651](https://github.com/inviqa/harness-base-php/pull/651) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Install build tools for spryker frontend on non-amd64 architectures [\#652](https://github.com/inviqa/harness-base-php/pull/652) ([andytson-inviqa](https://github.com/andytson-inviqa))

## [1.2.0](https://github.com/inviqa/harness-base-php/tree/1.2.0) (2021-12-10)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/1.1.2...1.2.0)

**Implemented enhancements:**

- Add Akeneo 5 support [\#578](https://github.com/inviqa/harness-base-php/issues/578)
- Add a "poweroff" command. [\#574](https://github.com/inviqa/harness-base-php/issues/574)
- Add varnish to drupal [\#570](https://github.com/inviqa/harness-base-php/issues/570)
- Switch chrome and lighthouse to chromium if not amd64 host [\#650](https://github.com/inviqa/harness-base-php/pull/650) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add volumeMode/Name support to k8s pvcs [\#649](https://github.com/inviqa/harness-base-php/pull/649) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add an upgrade note about mysql update [\#648](https://github.com/inviqa/harness-base-php/pull/648) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Update Jenkins to latest LTS release with multi-arch support [\#647](https://github.com/inviqa/harness-base-php/pull/647) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Include the project name in docker-compose project name in CI [\#646](https://github.com/inviqa/harness-base-php/pull/646) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add Spryker classmap for autoloading [\#644](https://github.com/inviqa/harness-base-php/pull/644) ([jbarton123](https://github.com/jbarton123))
- Switch mysql image to mysql/mysql-server if not amd64 host architecture, changing default to 8.0 [\#643](https://github.com/inviqa/harness-base-php/pull/643) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Update magento2 elasticsearch to 7.10.1 [\#641](https://github.com/inviqa/harness-base-php/pull/641) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Update elasticsearch default to latest version \(7.14.2\) [\#640](https://github.com/inviqa/harness-base-php/pull/640) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Pass platform through to external-image config and skip stage aliases [\#631](https://github.com/inviqa/harness-base-php/pull/631) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add support for elasticsearch https and http auth [\#630](https://github.com/inviqa/harness-base-php/pull/630) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Use new external network syntax [\#628](https://github.com/inviqa/harness-base-php/pull/628) ([kierenevans](https://github.com/kierenevans))
- MIX: remove redundant preview attributes overrides [\#623](https://github.com/inviqa/harness-base-php/pull/623) ([marcomc](https://github.com/marcomc))
- Pass through tideways hostname and env variable [\#622](https://github.com/inviqa/harness-base-php/pull/622) ([kierenevans](https://github.com/kierenevans))
- Add support for Ingress TLS attributes to be used by LetsEncrypt [\#620](https://github.com/inviqa/harness-base-php/pull/620) ([marcomc](https://github.com/marcomc))
- Add support for Akeneo v5 [\#619](https://github.com/inviqa/harness-base-php/pull/619) ([hgajjar](https://github.com/hgajjar))
- Fix dockerfile path with compose cli v2 [\#618](https://github.com/inviqa/harness-base-php/pull/618) ([kierenevans](https://github.com/kierenevans))
- Use an integer for varnish tmpfs size for compose cli v2 [\#617](https://github.com/inviqa/harness-base-php/pull/617) ([kierenevans](https://github.com/kierenevans))
- Switch changelog generator docker image [\#616](https://github.com/inviqa/harness-base-php/pull/616) ([kierenevans](https://github.com/kierenevans))
- Support proper booleans and discourage use of yes/no except in bash [\#613](https://github.com/inviqa/harness-base-php/pull/613) ([andytson-inviqa](https://github.com/andytson-inviqa))
- \#605 Explicitly declare development dependencies [\#612](https://github.com/inviqa/harness-base-php/pull/612) ([kierenevans](https://github.com/kierenevans))
- \#608: Use NGINX 1.21 [\#611](https://github.com/inviqa/harness-base-php/pull/611) ([kierenevans](https://github.com/kierenevans))
- Add docroot/themes/contrib/ to autoload-drupal and other stories [\#610](https://github.com/inviqa/harness-base-php/pull/610) ([dantleech](https://github.com/dantleech))
- Use memory for SQLite testing in drupal8 [\#604](https://github.com/inviqa/harness-base-php/pull/604) ([kierenevans](https://github.com/kierenevans))
- Update guidance on hanging mutagen commands [\#603](https://github.com/inviqa/harness-base-php/pull/603) ([kierenevans](https://github.com/kierenevans))
- Check for cache control header before using it [\#601](https://github.com/inviqa/harness-base-php/pull/601) ([kierenevans](https://github.com/kierenevans))
- Avoid syntax checking tests for drupal8 [\#600](https://github.com/inviqa/harness-base-php/pull/600) ([kierenevans](https://github.com/kierenevans))
- Add Varnish to Drupal [\#599](https://github.com/inviqa/harness-base-php/pull/599) ([kierenevans](https://github.com/kierenevans))
- Use built solr 4.x docker image [\#598](https://github.com/inviqa/harness-base-php/pull/598) ([kierenevans](https://github.com/kierenevans))
- Update Akeneo cronjobs [\#595](https://github.com/inviqa/harness-base-php/pull/595) ([a-ast](https://github.com/a-ast))
- Bring up mailhog in Jenkins, for integration tests that send emails [\#593](https://github.com/inviqa/harness-base-php/pull/593) ([kierenevans](https://github.com/kierenevans))
- Enable early feedback for drupal8 in Jenkins [\#591](https://github.com/inviqa/harness-base-php/pull/591) ([kierenevans](https://github.com/kierenevans))
- Enable early feedback for magento2 in Jenkins [\#590](https://github.com/inviqa/harness-base-php/pull/590) ([kierenevans](https://github.com/kierenevans))
- Use built image for lighthouse to speed up environments [\#588](https://github.com/inviqa/harness-base-php/pull/588) ([kierenevans](https://github.com/kierenevans))
- Move shellcheck to Jenkins. Add Hadolint [\#581](https://github.com/inviqa/harness-base-php/pull/581) ([kierenevans](https://github.com/kierenevans))

**Fixed bugs:**

- ws harness prepare from subdirectory on macOS skips mutagen volumes [\#562](https://github.com/inviqa/harness-base-php/issues/562)
- Fix issue with scratch:latest being added in `ws external-images config` [\#639](https://github.com/inviqa/harness-base-php/pull/639) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix handling of platform when BUILD/TARGETPLATFORM used in FROM [\#637](https://github.com/inviqa/harness-base-php/pull/637) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix issue parsing platform from Dockerfile FROM [\#636](https://github.com/inviqa/harness-base-php/pull/636) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Install the correct architecture tini for php images [\#634](https://github.com/inviqa/harness-base-php/pull/634) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix issue with MacOS Big Sur and later not using brew for mutagen [\#633](https://github.com/inviqa/harness-base-php/pull/633) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fetch the correct architecture mutagen binary for the host [\#632](https://github.com/inviqa/harness-base-php/pull/632) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix drupal8 build [\#626](https://github.com/inviqa/harness-base-php/pull/626) ([kierenevans](https://github.com/kierenevans))
- Resolve bug with empty database:import steps erroring [\#624](https://github.com/inviqa/harness-base-php/pull/624) ([andytson-inviqa](https://github.com/andytson-inviqa))
- MISC: Fix missing extensions.json file issue for akeneo [\#621](https://github.com/inviqa/harness-base-php/pull/621) ([hgajjar](https://github.com/hgajjar))
- Fix drupal8 build [\#615](https://github.com/inviqa/harness-base-php/pull/615) ([kierenevans](https://github.com/kierenevans))
- Fix webapp init container [\#609](https://github.com/inviqa/harness-base-php/pull/609) ([g-foster2](https://github.com/g-foster2))
- Fix mutagen volumes being missing [\#602](https://github.com/inviqa/harness-base-php/pull/602) ([kierenevans](https://github.com/kierenevans))
- Fix magento2 migrate pending on app:config:import question during setup:upgrade [\#597](https://github.com/inviqa/harness-base-php/pull/597) ([kierenevans](https://github.com/kierenevans))
- Lighthouse jenkins stages should be removed if lighthouse is disabled [\#594](https://github.com/inviqa/harness-base-php/pull/594) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix asking for shutdown [\#592](https://github.com/inviqa/harness-base-php/pull/592) ([kierenevans](https://github.com/kierenevans))
- Fix spacing with multiple build environment variables [\#589](https://github.com/inviqa/harness-base-php/pull/589) ([kierenevans](https://github.com/kierenevans))

**Deprecated:**

- Deprecate database.var attribute for newer services.mysql.options [\#642](https://github.com/inviqa/harness-base-php/pull/642) ([andytson-inviqa](https://github.com/andytson-inviqa))

**Closed issues:**

- NGINX 1.19 no longer in the supported tags list [\#608](https://github.com/inviqa/harness-base-php/issues/608)
- Explicitly declare phpcs as a dependency [\#605](https://github.com/inviqa/harness-base-php/issues/605)

## [1.1.2](https://github.com/inviqa/harness-base-php/tree/1.1.2) (2021-08-17)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/1.1.1...1.1.2)

**Implemented enhancements:**

- Add a "poweroff" command. [\#574](https://github.com/inviqa/harness-base-php/issues/574)
- Add varnish to drupal [\#570](https://github.com/inviqa/harness-base-php/issues/570)

**Fixed bugs:**

- ws harness prepare from subdirectory on macOS skips mutagen volumes [\#562](https://github.com/inviqa/harness-base-php/issues/562)

**Closed issues:**

- NGINX 1.19 no longer in the supported tags list [\#608](https://github.com/inviqa/harness-base-php/issues/608)
- Explicitly declare phpcs as a dependency [\#605](https://github.com/inviqa/harness-base-php/issues/605)

## [1.1.1](https://github.com/inviqa/harness-base-php/tree/1.1.1) (2021-04-06)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/1.1.0...1.1.1)

## [1.1.0](https://github.com/inviqa/harness-base-php/tree/1.1.0) (2021-04-02)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.11.1...1.1.0)

**Implemented enhancements:**

- Add v1.0 Upgrade Instructions [\#545](https://github.com/inviqa/harness-base-php/pull/545) ([kierenevans](https://github.com/kierenevans))
- Move the Spryker demoshop LICENSE to another filename [\#540](https://github.com/inviqa/harness-base-php/pull/540) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Enable docker buildkit for local installs [\#583](https://github.com/inviqa/harness-base-php/pull/583) ([kierenevans](https://github.com/kierenevans))
- Use buildkit for harness builds [\#582](https://github.com/inviqa/harness-base-php/pull/582) ([kierenevans](https://github.com/kierenevans))
- Update to Magento 2.4.2 [\#579](https://github.com/inviqa/harness-base-php/pull/579) ([kierenevans](https://github.com/kierenevans))
- Do not remove sync container, make more responsive to stop [\#572](https://github.com/inviqa/harness-base-php/pull/572) ([kierenevans](https://github.com/kierenevans))
- Introduce a ws rebuild command [\#568](https://github.com/inviqa/harness-base-php/pull/568) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Make curl fail helpfully and consistently [\#565](https://github.com/inviqa/harness-base-php/pull/565) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Early feedback in jenkins by running minimal build for isolated tests [\#561](https://github.com/inviqa/harness-base-php/pull/561) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Deprecate installing harness tools in php moving upstream [\#558](https://github.com/inviqa/harness-base-php/pull/558) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Prepare console build as early as possible [\#557](https://github.com/inviqa/harness-base-php/pull/557) ([andytson-inviqa](https://github.com/andytson-inviqa))
- \[DEVOPS-1181\] Validating Lighthouse scores against configured pass values [\#556](https://github.com/inviqa/harness-base-php/pull/556) ([g-foster2](https://github.com/g-foster2))
- Upgrade Symfony to 5.2 [\#553](https://github.com/inviqa/harness-base-php/pull/553) ([kierenevans](https://github.com/kierenevans))
- Remove duplicate entry in Akeneo's .gitignore [\#552](https://github.com/inviqa/harness-base-php/pull/552) ([jameshalsall](https://github.com/jameshalsall))
- Simplify cleanup in ws destroy [\#550](https://github.com/inviqa/harness-base-php/pull/550) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add Jaeger Relay [\#549](https://github.com/inviqa/harness-base-php/pull/549) ([kierenevans](https://github.com/kierenevans))
- Implement ws external-images ls/rm and use for ws destroy --all [\#548](https://github.com/inviqa/harness-base-php/pull/548) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add Zed API hosts for supporting back-channel communication [\#547](https://github.com/inviqa/harness-base-php/pull/547) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Clean up ingress template [\#546](https://github.com/inviqa/harness-base-php/pull/546) ([kierenevans](https://github.com/kierenevans))

**Fixed bugs:**

- Assets need to be included in the console build [\#587](https://github.com/inviqa/harness-base-php/pull/587) ([kierenevans](https://github.com/kierenevans))
- Clean up old mutagen sync sessions [\#586](https://github.com/inviqa/harness-base-php/pull/586) ([kierenevans](https://github.com/kierenevans))
- Switch to msmtp to avoid DNS issues with mhsendmail [\#585](https://github.com/inviqa/harness-base-php/pull/585) ([kierenevans](https://github.com/kierenevans))
- Fix reference to attribute for akeneo [\#584](https://github.com/inviqa/harness-base-php/pull/584) ([kierenevans](https://github.com/kierenevans))
- Use data path for Spryker twig cache [\#575](https://github.com/inviqa/harness-base-php/pull/575) ([kierenevans](https://github.com/kierenevans))
- Fix spryker docker hosts having CI namespace issues [\#569](https://github.com/inviqa/harness-base-php/pull/569) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix issue with Jenkins runner being disabled when not using harness helm [\#567](https://github.com/inviqa/harness-base-php/pull/567) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix executing "ws secret encrypt" when printing help message [\#563](https://github.com/inviqa/harness-base-php/pull/563) ([kierenevans](https://github.com/kierenevans))
- Add missing translator cache and run split codebucket store tasks [\#560](https://github.com/inviqa/harness-base-php/pull/560) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add missed files relating to the spryker API host changes [\#551](https://github.com/inviqa/harness-base-php/pull/551) ([andytson-inviqa](https://github.com/andytson-inviqa))

## [0.11.1](https://github.com/inviqa/harness-base-php/tree/0.11.1) (2021-03-17)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.10.2...0.11.1)

## [0.10.2](https://github.com/inviqa/harness-base-php/tree/0.10.2) (2021-03-17)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.9.5...0.10.2)

## [0.9.5](https://github.com/inviqa/harness-base-php/tree/0.9.5) (2021-03-17)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/1.0.3...0.9.5)

## [1.0.3](https://github.com/inviqa/harness-base-php/tree/1.0.3) (2021-01-29)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/1.0.2...1.0.3)

**Fixed bugs:**

- Fix spryker ingress not having any rules [\#544](https://github.com/inviqa/harness-base-php/pull/544) ([kierenevans](https://github.com/kierenevans))

## [1.0.2](https://github.com/inviqa/harness-base-php/tree/1.0.2) (2021-01-29)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/1.0.1...1.0.2)

**Fixed bugs:**

- Fix ws destroy on macOS [\#543](https://github.com/inviqa/harness-base-php/pull/543) ([kierenevans](https://github.com/kierenevans))

## [1.0.1](https://github.com/inviqa/harness-base-php/tree/1.0.1) (2021-01-29)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.12.1...1.0.1)

**Fixed bugs:**

- Fix sealed secret template [\#542](https://github.com/inviqa/harness-base-php/pull/542) ([kierenevans](https://github.com/kierenevans))
- Fix drush updatedb hanging [\#541](https://github.com/inviqa/harness-base-php/pull/541) ([kierenevans](https://github.com/kierenevans))

## [0.12.1](https://github.com/inviqa/harness-base-php/tree/0.12.1) (2021-01-29)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/1.0.0...0.12.1)

**Fixed bugs:**

- Fix sealed secret template [\#539](https://github.com/inviqa/harness-base-php/pull/539) ([kierenevans](https://github.com/kierenevans))

## [1.0.0](https://github.com/inviqa/harness-base-php/tree/1.0.0) (2021-01-28)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.12.0...1.0.0)

**Breaking changes:**

- Update ingress api version [\#535](https://github.com/inviqa/harness-base-php/pull/535) ([kierenevans](https://github.com/kierenevans))
- Rename AWS Credentials [\#533](https://github.com/inviqa/harness-base-php/pull/533) ([kierenevans](https://github.com/kierenevans))
- Remove docker-sync support [\#530](https://github.com/inviqa/harness-base-php/pull/530) ([kierenevans](https://github.com/kierenevans))
- Rename magento.static\_content.backend to magento.static\_content.adminhtml [\#526](https://github.com/inviqa/harness-base-php/pull/526) ([kierenevans](https://github.com/kierenevans))
- Remove deprecations [\#519](https://github.com/inviqa/harness-base-php/pull/519) ([kierenevans](https://github.com/kierenevans))
- Fix redis-session not enabled on kubernetes [\#518](https://github.com/inviqa/harness-base-php/pull/518) ([kierenevans](https://github.com/kierenevans))

**Implemented enhancements:**

- Upgrade xdebug version to 3.0 [\#491](https://github.com/inviqa/harness-base-php/issues/491)
- Rename aws.id and aws.key and env vars to match aws's standard env var naming [\#100](https://github.com/inviqa/harness-base-php/issues/100)
- Join lighthouse to the private network [\#537](https://github.com/inviqa/harness-base-php/pull/537) ([kierenevans](https://github.com/kierenevans))
- \#508 Use drush [\#536](https://github.com/inviqa/harness-base-php/pull/536) ([kierenevans](https://github.com/kierenevans))
- Add a command hook to cleanup built images [\#534](https://github.com/inviqa/harness-base-php/pull/534) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Update magento2 NGINX config to 2.4.1 [\#532](https://github.com/inviqa/harness-base-php/pull/532) ([kierenevans](https://github.com/kierenevans))
- Update magento2 VCL to 2.4.1 [\#531](https://github.com/inviqa/harness-base-php/pull/531) ([kierenevans](https://github.com/kierenevans))
- Use App namespace for akeneo behat bootstrap [\#529](https://github.com/inviqa/harness-base-php/pull/529) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix lib folder not being readable [\#528](https://github.com/inviqa/harness-base-php/pull/528) ([kierenevans](https://github.com/kierenevans))
- Adjust spryker to use hostname\_aliases for nginx [\#527](https://github.com/inviqa/harness-base-php/pull/527) ([kierenevans](https://github.com/kierenevans))
- DEVOPS-1181 lighthouse integration [\#521](https://github.com/inviqa/harness-base-php/pull/521) ([g-foster2](https://github.com/g-foster2))
- \#67 Detect if containers exist during `ws enable` [\#517](https://github.com/inviqa/harness-base-php/pull/517) ([kierenevans](https://github.com/kierenevans))
- Xdebug 3 opt-in & config support [\#500](https://github.com/inviqa/harness-base-php/pull/500) ([Persata](https://github.com/Persata))

**Fixed bugs:**

- Use the runtime environment APPLICATION\_ENV for spryker install [\#525](https://github.com/inviqa/harness-base-php/pull/525) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Remove Apache License v2 from readme skeleton [\#523](https://github.com/inviqa/harness-base-php/pull/523) ([andytson-inviqa](https://github.com/andytson-inviqa))

**Closed issues:**

- Standardise on Drush [\#508](https://github.com/inviqa/harness-base-php/issues/508)
- Detect if containers have been deleted without deleting .flag-built [\#67](https://github.com/inviqa/harness-base-php/issues/67)

## [0.12.0](https://github.com/inviqa/harness-base-php/tree/0.12.0) (2021-01-13)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.11.0...0.12.0)

**Implemented enhancements:**

- Consolidate docker images used [\#502](https://github.com/inviqa/harness-base-php/issues/502)
- Add PHP 8.0 support [\#496](https://github.com/inviqa/harness-base-php/issues/496)
- Use a file based opcache for CLI tasks in production mode [\#495](https://github.com/inviqa/harness-base-php/issues/495)
- Add composer 2.0 support [\#492](https://github.com/inviqa/harness-base-php/issues/492)
- Enable opcache for CLI in console [\#16](https://github.com/inviqa/harness-base-php/issues/16)
- Configure php-fpm's opcache settings [\#15](https://github.com/inviqa/harness-base-php/issues/15)
- Use PHP 8.0 for no-framework and symfony [\#506](https://github.com/inviqa/harness-base-php/pull/506) ([kierenevans](https://github.com/kierenevans))
- Add Composer 2.0 Support [\#505](https://github.com/inviqa/harness-base-php/pull/505) ([kierenevans](https://github.com/kierenevans))
- Consolidate docker images used [\#503](https://github.com/inviqa/harness-base-php/pull/503) ([kierenevans](https://github.com/kierenevans))
- Improve instructions for harness upgrades [\#501](https://github.com/inviqa/harness-base-php/pull/501) ([kierenevans](https://github.com/kierenevans))
- Configure file based opcache for cli [\#499](https://github.com/inviqa/harness-base-php/pull/499) ([kierenevans](https://github.com/kierenevans))
- Use authoritative classmap for composer [\#497](https://github.com/inviqa/harness-base-php/pull/497) ([kierenevans](https://github.com/kierenevans))
- Raise opcache settings for Magento 1, Magento 2 and Spryker [\#494](https://github.com/inviqa/harness-base-php/pull/494) ([kierenevans](https://github.com/kierenevans))
- Fix magento2 strip config [\#490](https://github.com/inviqa/harness-base-php/pull/490) ([kierenevans](https://github.com/kierenevans))
- Change application.yml.dist deprecation to twig comment [\#486](https://github.com/inviqa/harness-base-php/pull/486) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Clean exit if there is a failure to parse docker-compose config [\#485](https://github.com/inviqa/harness-base-php/pull/485) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Update external-images CI pull to skip pulling images locally existing [\#483](https://github.com/inviqa/harness-base-php/pull/483) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Trust workspace or pipeline host for drupal [\#482](https://github.com/inviqa/harness-base-php/pull/482) ([kierenevans](https://github.com/kierenevans))
- Add standard k8s/helm labels [\#481](https://github.com/inviqa/harness-base-php/pull/481) ([andytson-inviqa](https://github.com/andytson-inviqa))

**Fixed bugs:**

- Fix drupal8 site:install command [\#498](https://github.com/inviqa/harness-base-php/pull/498) ([kierenevans](https://github.com/kierenevans))
- Use correct distribution for akeneo db fixtures. [\#522](https://github.com/inviqa/harness-base-php/pull/522) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Increase shutdown timeout to 2 minutes from 10 seconds [\#516](https://github.com/inviqa/harness-base-php/pull/516) ([kierenevans](https://github.com/kierenevans))
- Make Jenkins env vars configurable and disable CSRF [\#514](https://github.com/inviqa/harness-base-php/pull/514) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Override zed session cookie domain from zed.de.suite.local [\#511](https://github.com/inviqa/harness-base-php/pull/511) ([kierenevans](https://github.com/kierenevans))
- Fix static content deploy for admin theme [\#510](https://github.com/inviqa/harness-base-php/pull/510) ([kierenevans](https://github.com/kierenevans))
- Fix setup:static-content:deploy before 2.4.1 [\#507](https://github.com/inviqa/harness-base-php/pull/507) ([kierenevans](https://github.com/kierenevans))
- Fix 'ws switch docker-sync' [\#504](https://github.com/inviqa/harness-base-php/pull/504) ([kierenevans](https://github.com/kierenevans))
- Fix external-images pull locally [\#489](https://github.com/inviqa/harness-base-php/pull/489) ([kierenevans](https://github.com/kierenevans))
- Fix akeneo build [\#488](https://github.com/inviqa/harness-base-php/pull/488) ([kierenevans](https://github.com/kierenevans))
- Skip php-fpm \(unless cron enabled\) and nginx being built in CI if webapp disabled [\#487](https://github.com/inviqa/harness-base-php/pull/487) ([andytson-inviqa](https://github.com/andytson-inviqa))

**Security fixes:**

- Update Jenkins docker image to supported latest lts [\#509](https://github.com/inviqa/harness-base-php/pull/509) ([andytson-inviqa](https://github.com/andytson-inviqa))

**Closed issues:**

- Convert Spryker secrets to sealed secrets [\#446](https://github.com/inviqa/harness-base-php/issues/446)
- \[magento2\] strip-magento-config removes minification settings [\#270](https://github.com/inviqa/harness-base-php/issues/270)

## [0.11.0](https://github.com/inviqa/harness-base-php/tree/0.11.0) (2020-10-30)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.10.1...0.11.0)

**Implemented enhancements:**

- Add option for varnish container as the entrypoint to the site in Magento 1.x harness [\#13](https://github.com/inviqa/harness-base-php/issues/13)
- Use Magento 2.2+ pipeline deploy steps to avoid needing to init the environment in static build [\#12](https://github.com/inviqa/harness-base-php/issues/12)
- \[magento2\] Allow customising the languages to build static assets for [\#421](https://github.com/inviqa/harness-base-php/issues/421)
- Add LICENSE [\#137](https://github.com/inviqa/harness-base-php/issues/137)
- Add composer validate as a quality check [\#480](https://github.com/inviqa/harness-base-php/pull/480) ([kierenevans](https://github.com/kierenevans))
- Document how to upgrade harness versions [\#477](https://github.com/inviqa/harness-base-php/pull/477) ([kierenevans](https://github.com/kierenevans))
- Document mailhog URL [\#476](https://github.com/inviqa/harness-base-php/pull/476) ([kierenevans](https://github.com/kierenevans))
- Add persistence for Spryker jenkins home [\#475](https://github.com/inviqa/harness-base-php/pull/475) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Define service resources from within services.{service}.resources values [\#474](https://github.com/inviqa/harness-base-php/pull/474) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add Solr for local environment [\#473](https://github.com/inviqa/harness-base-php/pull/473) ([kierenevans](https://github.com/kierenevans))
- Customisable static asset language and theme deployments [\#472](https://github.com/inviqa/harness-base-php/pull/472) ([kierenevans](https://github.com/kierenevans))
- MISC replace unnecessary $root with $ in helm chart [\#471](https://github.com/inviqa/harness-base-php/pull/471) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Make services.\*.enabled able to disable all services \(including webapp\) [\#470](https://github.com/inviqa/harness-base-php/pull/470) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add License [\#469](https://github.com/inviqa/harness-base-php/pull/469) ([kierenevans](https://github.com/kierenevans))
- Add Magento 2 var/export PersistentVolumeClaim [\#468](https://github.com/inviqa/harness-base-php/pull/468) ([kierenevans](https://github.com/kierenevans))
- Upgrade to NGINX 1.19 [\#466](https://github.com/inviqa/harness-base-php/pull/466) ([kierenevans](https://github.com/kierenevans))
- Rewrite local.xml on container startup [\#465](https://github.com/inviqa/harness-base-php/pull/465) ([kierenevans](https://github.com/kierenevans))
- Prompt for the community or enterprise edition for Akeneo when creating a project [\#464](https://github.com/inviqa/harness-base-php/pull/464) ([kierenevans](https://github.com/kierenevans))
- Push the helm chart to the default branch of the cluster repository [\#459](https://github.com/inviqa/harness-base-php/pull/459) ([kierenevans](https://github.com/kierenevans))
- Remove the lost+found removal and improve handling [\#457](https://github.com/inviqa/harness-base-php/pull/457) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Deployable tideways daemon [\#456](https://github.com/inviqa/harness-base-php/pull/456) ([kierenevans](https://github.com/kierenevans))
- Add support for MySQL 8 [\#454](https://github.com/inviqa/harness-base-php/pull/454) ([kierenevans](https://github.com/kierenevans))
- Varnish - Add checksum of configmap to the pods [\#453](https://github.com/inviqa/harness-base-php/pull/453) ([kierenevans](https://github.com/kierenevans))
- Allow specifying cert, namespace and scope for sealed-secrets [\#451](https://github.com/inviqa/harness-base-php/pull/451) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Upgrade Magento to 2.4.1 [\#450](https://github.com/inviqa/harness-base-php/pull/450) ([tkotosz](https://github.com/tkotosz))
- Configure pipeline environments to talk to mailhog for sendmail [\#444](https://github.com/inviqa/harness-base-php/pull/444) ([kierenevans](https://github.com/kierenevans))
- Adding attributes for fastcgi buffers and buffer size. [\#440](https://github.com/inviqa/harness-base-php/pull/440) ([sawtell](https://github.com/sawtell))
- Use PHP 7.4 where we can [\#436](https://github.com/inviqa/harness-base-php/pull/436) ([kierenevans](https://github.com/kierenevans))
- Support Spryker 202009 release [\#398](https://github.com/inviqa/harness-base-php/pull/398) ([hgajjar](https://github.com/hgajjar))
- Test all harnesses against pre-release workspace [\#365](https://github.com/inviqa/harness-base-php/pull/365) ([andytson-inviqa](https://github.com/andytson-inviqa))

**Fixed bugs:**

- Add missing sealed-secret scope header change [\#479](https://github.com/inviqa/harness-base-php/pull/479) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix solr data path [\#478](https://github.com/inviqa/harness-base-php/pull/478) ([kierenevans](https://github.com/kierenevans))
- Fix Magento 1 app init not running migrations [\#467](https://github.com/inviqa/harness-base-php/pull/467) ([kierenevans](https://github.com/kierenevans))
- Fix JENKINS\_HOST environment variable not being overridden in helm chart [\#461](https://github.com/inviqa/harness-base-php/pull/461) ([kierenevans](https://github.com/kierenevans))
- Fix wrong indentation level for mailhog in preview environments [\#460](https://github.com/inviqa/harness-base-php/pull/460) ([kierenevans](https://github.com/kierenevans))
- Use proper escaping for database credentials in assets apply/dump [\#458](https://github.com/inviqa/harness-base-php/pull/458) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix git.default\_branch not using git.main\_branch [\#455](https://github.com/inviqa/harness-base-php/pull/455) ([kierenevans](https://github.com/kierenevans))
- Deploy supporting services in wave 4 [\#452](https://github.com/inviqa/harness-base-php/pull/452) ([kierenevans](https://github.com/kierenevans))
- Magento 2 cron needs zombies to exist [\#449](https://github.com/inviqa/harness-base-php/pull/449) ([kierenevans](https://github.com/kierenevans))
- Fix Magento 2 steps if not using elasticsearch [\#448](https://github.com/inviqa/harness-base-php/pull/448) ([kierenevans](https://github.com/kierenevans))
- Lock the git push for chart publishing [\#447](https://github.com/inviqa/harness-base-php/pull/447) ([kierenevans](https://github.com/kierenevans))
- Fix behat reliability on drupal8 by moving phpunit to be after it [\#445](https://github.com/inviqa/harness-base-php/pull/445) ([kierenevans](https://github.com/kierenevans))

**Closed issues:**

- NGINX 1.17 no longer supported [\#429](https://github.com/inviqa/harness-base-php/issues/429)
- Update Spryker version to 202009.0 and php version to 7.4 [\#397](https://github.com/inviqa/harness-base-php/issues/397)
- Add Solr to the Drupal 8 harness [\#395](https://github.com/inviqa/harness-base-php/issues/395)

## [0.10.1](https://github.com/inviqa/harness-base-php/tree/0.10.1) (2020-10-02)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.10.0...0.10.1)

**Implemented enhancements:**

- Fix rogue spaces in Jenkinsfile [\#437](https://github.com/inviqa/harness-base-php/pull/437) ([kierenevans](https://github.com/kierenevans))

**Fixed bugs:**

- Fix elasticsearch mountpoint [\#443](https://github.com/inviqa/harness-base-php/pull/443) ([kierenevans](https://github.com/kierenevans))
- Fix resource prefixed magento and akeneo [\#442](https://github.com/inviqa/harness-base-php/pull/442) ([kierenevans](https://github.com/kierenevans))
- Fix zed readme/docker hosts [\#439](https://github.com/inviqa/harness-base-php/pull/439) ([kierenevans](https://github.com/kierenevans))
- MISC Downgrade elastic search to the latest Adobe Commerce Cloud-supported version [\#435](https://github.com/inviqa/harness-base-php/pull/435) ([tkotosz](https://github.com/tkotosz))
- Fix frontend watch command [\#434](https://github.com/inviqa/harness-base-php/pull/434) ([kierenevans](https://github.com/kierenevans))

**Closed issues:**

- \[k8s\] Elasticsearch does not boot with persistent storage enabled [\#441](https://github.com/inviqa/harness-base-php/issues/441)

## [0.10.0](https://github.com/inviqa/harness-base-php/tree/0.10.0) (2020-09-30)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.9.4...0.10.0)

**Implemented enhancements:**

- Add appropriate phpstan configuration to each harness [\#43](https://github.com/inviqa/harness-base-php/issues/43)
- Add a 'migrate' task to facilitate continuous deployment [\#41](https://github.com/inviqa/harness-base-php/issues/41)
- When a preview environment is created via Jenkins post the URL to the PR [\#40](https://github.com/inviqa/harness-base-php/issues/40)
- Create an MVP helm chart for preview environments [\#37](https://github.com/inviqa/harness-base-php/issues/37)
- Redis 4 no longer supported [\#430](https://github.com/inviqa/harness-base-php/issues/430)
- Remove CI port forwarding [\#432](https://github.com/inviqa/harness-base-php/pull/432) ([kierenevans](https://github.com/kierenevans))
- Switch to Redis 5 [\#431](https://github.com/inviqa/harness-base-php/pull/431) ([tkotosz](https://github.com/tkotosz))
- Test using 3 Jenkins workers [\#428](https://github.com/inviqa/harness-base-php/pull/428) ([kierenevans](https://github.com/kierenevans))
- Spryker - Do not wait 60 seconds if the queue is empty [\#427](https://github.com/inviqa/harness-base-php/pull/427) ([kierenevans](https://github.com/kierenevans))
- Upgrade Magento to 2.4.0 [\#425](https://github.com/inviqa/harness-base-php/pull/425) ([tkotosz](https://github.com/tkotosz))
- Bump minimum docker-compose version required [\#424](https://github.com/inviqa/harness-base-php/pull/424) ([kierenevans](https://github.com/kierenevans))
- MISC Fix redis flush command name [\#423](https://github.com/inviqa/harness-base-php/pull/423) ([tkotosz](https://github.com/tkotosz))
- Copy redis-cli from the first enabled redis service's image [\#420](https://github.com/inviqa/harness-base-php/pull/420) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Use base OS appropriate Spryker jenkins runner java version [\#419](https://github.com/inviqa/harness-base-php/pull/419) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add drupal8 cron configuration [\#418](https://github.com/inviqa/harness-base-php/pull/418) ([kierenevans](https://github.com/kierenevans))
- Move MySQL 8 CLI installation to docker image from harness [\#413](https://github.com/inviqa/harness-base-php/pull/413) ([kierenevans](https://github.com/kierenevans))
- Add Blackfire Support [\#412](https://github.com/inviqa/harness-base-php/pull/412) ([kierenevans](https://github.com/kierenevans))
- Add Tideways Support [\#411](https://github.com/inviqa/harness-base-php/pull/411) ([kierenevans](https://github.com/kierenevans))
- Update skeleton README with more hostnames [\#409](https://github.com/inviqa/harness-base-php/pull/409) ([kierenevans](https://github.com/kierenevans))
- Update phpmd ruleset for Magento 2 [\#407](https://github.com/inviqa/harness-base-php/pull/407) ([tkotosz](https://github.com/tkotosz))
- Switch to PSR12 coding standard [\#406](https://github.com/inviqa/harness-base-php/pull/406) ([tkotosz](https://github.com/tkotosz))
- Add phpstan-symfony extension [\#404](https://github.com/inviqa/harness-base-php/pull/404) ([kierenevans](https://github.com/kierenevans))
- Configure symfony harness [\#394](https://github.com/inviqa/harness-base-php/pull/394) ([kierenevans](https://github.com/kierenevans))
- Add alternative local/http sealed-secret seal certificate [\#393](https://github.com/inviqa/harness-base-php/pull/393) ([andytson-inviqa](https://github.com/andytson-inviqa))
- MISC Support base64 decoding in more OSes [\#392](https://github.com/inviqa/harness-base-php/pull/392) ([andytson-inviqa](https://github.com/andytson-inviqa))
- MISC Publish images and chart only when needed [\#391](https://github.com/inviqa/harness-base-php/pull/391) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Automatically choose buster based images if php 7.4 [\#390](https://github.com/inviqa/harness-base-php/pull/390) ([kierenevans](https://github.com/kierenevans))
- Handle service enabled/image as services attributes [\#388](https://github.com/inviqa/harness-base-php/pull/388) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Support Docker Desktop Edge 2.3.5.0 which ships with grpcFUSE filesystem drivers [\#386](https://github.com/inviqa/harness-base-php/pull/386) ([kierenevans](https://github.com/kierenevans))
- Add secrets into argo sync wave 1 [\#384](https://github.com/inviqa/harness-base-php/pull/384) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Run everything via entrypoint script [\#381](https://github.com/inviqa/harness-base-php/pull/381) ([kierenevans](https://github.com/kierenevans))
- Allow custom console and cron startup commands [\#380](https://github.com/inviqa/harness-base-php/pull/380) ([kierenevans](https://github.com/kierenevans))
- Magento 1.x crypt key is a secret [\#379](https://github.com/inviqa/harness-base-php/pull/379) ([kierenevans](https://github.com/kierenevans))
- Allow easy publish environment settings in Jenkins [\#378](https://github.com/inviqa/harness-base-php/pull/378) ([kierenevans](https://github.com/kierenevans))
- Make jenkins service optional for Spryker harness [\#377](https://github.com/inviqa/harness-base-php/pull/377) ([hgajjar](https://github.com/hgajjar))
- Make the Spryker jenkins runner single executor, multi containers [\#373](https://github.com/inviqa/harness-base-php/pull/373) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Switch away from bad PID 1 processes to tini [\#371](https://github.com/inviqa/harness-base-php/pull/371) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Increase push timeout for docker-compose [\#370](https://github.com/inviqa/harness-base-php/pull/370) ([kierenevans](https://github.com/kierenevans))
- Spryker version upgrade and other improvements [\#352](https://github.com/inviqa/harness-base-php/pull/352) ([hgajjar](https://github.com/hgajjar))
- Adding documentation for setting up workspace on Drupal projects [\#281](https://github.com/inviqa/harness-base-php/pull/281) ([sawtell](https://github.com/sawtell))

**Fixed bugs:**

- Akeneo - fix random build failures [\#426](https://github.com/inviqa/harness-base-php/pull/426) ([kierenevans](https://github.com/kierenevans))
- Fix varnish PURGE in development environment [\#422](https://github.com/inviqa/harness-base-php/pull/422) ([tkotosz](https://github.com/tkotosz))
- Move php error reporting so it is available for both cli and fpm [\#417](https://github.com/inviqa/harness-base-php/pull/417) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Wait for elasticsearch before using it in akeneo [\#415](https://github.com/inviqa/harness-base-php/pull/415) ([kierenevans](https://github.com/kierenevans))
- Fix Akeneo 4 file storage directory location [\#414](https://github.com/inviqa/harness-base-php/pull/414) ([kierenevans](https://github.com/kierenevans))
- Fix drupal build to find a Trait the plugins couldn't find [\#410](https://github.com/inviqa/harness-base-php/pull/410) ([kierenevans](https://github.com/kierenevans))
- Use original base64 -d for support in more linuxes [\#408](https://github.com/inviqa/harness-base-php/pull/408) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix bug in processing non-interactive sealed-secret input [\#403](https://github.com/inviqa/harness-base-php/pull/403) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix Spryker build by not updating spryker web-profiler dependencies [\#402](https://github.com/inviqa/harness-base-php/pull/402) ([kierenevans](https://github.com/kierenevans))
- Use magento root directory for module manifest [\#400](https://github.com/inviqa/harness-base-php/pull/400) ([kierenevans](https://github.com/kierenevans))
- Fix 'ws feature xdebug on/off' [\#396](https://github.com/inviqa/harness-base-php/pull/396) ([kierenevans](https://github.com/kierenevans))
- Fix php syntax check not exiting with non-zero exit code on error [\#389](https://github.com/inviqa/harness-base-php/pull/389) ([kierenevans](https://github.com/kierenevans))
- Updating phpcs rules to allow void return type. [\#387](https://github.com/inviqa/harness-base-php/pull/387) ([sawtell](https://github.com/sawtell))
- Recreate services that use persistent volumes to avoid multi-node usage attempts [\#385](https://github.com/inviqa/harness-base-php/pull/385) ([kierenevans](https://github.com/kierenevans))
- Image pull config must be present before app-init job [\#383](https://github.com/inviqa/harness-base-php/pull/383) ([kierenevans](https://github.com/kierenevans))
- Pull external images first missing from akeneo and spryker [\#382](https://github.com/inviqa/harness-base-php/pull/382) ([andytson-inviqa](https://github.com/andytson-inviqa))
- No port for job queue consumer [\#376](https://github.com/inviqa/harness-base-php/pull/376) ([kierenevans](https://github.com/kierenevans))
- Switch back to the default docker stop signal in cli images [\#375](https://github.com/inviqa/harness-base-php/pull/375) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix image pull config secret name [\#374](https://github.com/inviqa/harness-base-php/pull/374) ([kierenevans](https://github.com/kierenevans))
- Run spryker jenkins runner agent foreground [\#372](https://github.com/inviqa/harness-base-php/pull/372) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix drush relative docroot fails [\#366](https://github.com/inviqa/harness-base-php/pull/366) ([kierenevans](https://github.com/kierenevans))
- Replace global zed host with store specific hosts [\#359](https://github.com/inviqa/harness-base-php/pull/359) ([hgajjar](https://github.com/hgajjar))

**Closed issues:**

- Spryker build failing on 0.10.x [\#401](https://github.com/inviqa/harness-base-php/issues/401)
- Update spryker harness after latest B2C release [\#143](https://github.com/inviqa/harness-base-php/issues/143)

## [0.9.4](https://github.com/inviqa/harness-base-php/tree/0.9.4) (2020-08-20)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.9.3...0.9.4)

**Fixed bugs:**

- More akeneo secrets [\#369](https://github.com/inviqa/harness-base-php/pull/369) ([kierenevans](https://github.com/kierenevans))

**Closed issues:**

- Plan: multiple environments [\#171](https://github.com/inviqa/harness-base-php/issues/171)

## [0.9.3](https://github.com/inviqa/harness-base-php/tree/0.9.3) (2020-08-19)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.9.2...0.9.3)

**Fixed bugs:**

- Fix frontend commands not loading nvm [\#368](https://github.com/inviqa/harness-base-php/pull/368) ([kierenevans](https://github.com/kierenevans))

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
- Remove spryker console dev image when destroying ws environment [\#340](https://github.com/inviqa/harness-base-php/pull/340) ([kierenevans](https://github.com/kierenevans))
- Set host volume options to cached and make a delegated-volumes flag [\#334](https://github.com/inviqa/harness-base-php/pull/334) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix varnish cache clearing for magento2 when using resource prefixes [\#333](https://github.com/inviqa/harness-base-php/pull/333) ([kierenevans](https://github.com/kierenevans))
- Use the production DI for magento2 in phpspec/phpstan [\#330](https://github.com/inviqa/harness-base-php/pull/330) ([kierenevans](https://github.com/kierenevans))

## [0.8.0](https://github.com/inviqa/harness-base-php/tree/0.8.0) (2020-06-18)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.7.0...0.8.0)

**Breaking changes:**

- Add Varnish [\#309](https://github.com/inviqa/harness-base-php/pull/309) ([kierenevans](https://github.com/kierenevans))

**Implemented enhancements:**

- Use mutagen by default [\#323](https://github.com/inviqa/harness-base-php/pull/323) ([kierenevans](https://github.com/kierenevans))
- Speed up Spryker build [\#319](https://github.com/inviqa/harness-base-php/pull/319) ([kierenevans](https://github.com/kierenevans))
- Run phpstan separately for drupal8 [\#325](https://github.com/inviqa/harness-base-php/pull/325) ([kierenevans](https://github.com/kierenevans))
- Improve Xdebug IDE support by not assuming PHPStorm [\#324](https://github.com/inviqa/harness-base-php/pull/324) ([kierenevans](https://github.com/kierenevans))
- Fix simpletest usage for Drupal 8 [\#322](https://github.com/inviqa/harness-base-php/pull/322) ([kierenevans](https://github.com/kierenevans))
- Let production mode work for magento2  [\#318](https://github.com/inviqa/harness-base-php/pull/318) ([kierenevans](https://github.com/kierenevans))
- Allow the Magento2 executable to be called from the host machine [\#316](https://github.com/inviqa/harness-base-php/pull/316) ([jbarton123](https://github.com/jbarton123))
- Enable local mail by default [\#315](https://github.com/inviqa/harness-base-php/pull/315) ([kierenevans](https://github.com/kierenevans))
- Use PHP 7.3 by default in magento2 [\#314](https://github.com/inviqa/harness-base-php/pull/314) ([kierenevans](https://github.com/kierenevans))
- Improve speed of permissions fixes [\#310](https://github.com/inviqa/harness-base-php/pull/310) ([kierenevans](https://github.com/kierenevans))
- Add redis-session persistent storage enabled by default [\#305](https://github.com/inviqa/harness-base-php/pull/305) ([kierenevans](https://github.com/kierenevans))
- Add harness update commands [\#299](https://github.com/inviqa/harness-base-php/pull/299) ([kierenevans](https://github.com/kierenevans))

**Fixed bugs:**

- Fix drupal8 phpstan-prophecy path [\#327](https://github.com/inviqa/harness-base-php/pull/327) ([kierenevans](https://github.com/kierenevans))
- Remove web writable generated directory for Magento2 [\#320](https://github.com/inviqa/harness-base-php/pull/320) ([jbarton123](https://github.com/jbarton123))
- Fix wrong hosts entry on startup [\#317](https://github.com/inviqa/harness-base-php/pull/317) ([kierenevans](https://github.com/kierenevans))
- Fix drupal8 build [\#311](https://github.com/inviqa/harness-base-php/pull/311) ([kierenevans](https://github.com/kierenevans))
- Align framework overrides with base. Update Magento 2 NGINX config. [\#291](https://github.com/inviqa/harness-base-php/pull/291) ([kierenevans](https://github.com/kierenevans))

**Merged pull requests:**

- Bump PHPStan Prophecy based on dependabot upgrading another project [\#321](https://github.com/inviqa/harness-base-php/pull/321) ([kierenevans](https://github.com/kierenevans))
- Bump Magento 1 to 1.14.4.5 [\#313](https://github.com/inviqa/harness-base-php/pull/313) ([kierenevans](https://github.com/kierenevans))
- Bump Magento 2 to 2.3.5-p1 [\#312](https://github.com/inviqa/harness-base-php/pull/312) ([kierenevans](https://github.com/kierenevans))

## [0.7.0](https://github.com/inviqa/harness-base-php/tree/0.7.0) (2020-05-29)

[Full Changelog](https://github.com/inviqa/harness-base-php/compare/0.6.0...0.7.0)

**Breaking changes:**

- Akeneo 4.x Support [\#287](https://github.com/inviqa/harness-base-php/pull/287) ([kierenevans](https://github.com/kierenevans))

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

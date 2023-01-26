# CHANGELOG

## 1.5.0 - 20230126

### Added attributes

* `attribute('console.state.steps')` - Steps necessary to test the health of the console container
* `attribute('console.healthcheck.enabled')` - Defaults to `true` only for local builds
* `attribute('console.healthcheck.test')` - The command in array format that will run the healthcheck - Defaults to ['CMD', 'app', 'state']
* `attribute('console.healthcheck.test.start_period')` - Defaults to 5s
* `attribute('console.healthcheck.test.interval')` - Defaults to 5s
* `attribute('console.healthcheck.test.timeout')` - Defaults to 3s
* `attribute('console.healthcheck.test.retries')` - Defaults to 10

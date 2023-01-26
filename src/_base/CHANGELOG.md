# CHANGELOG

## 1.5.0 - 20230126

### Added attributes

* `attribute('console.healthcheck.enabled')` - Defaults to `true` only for local builds
* `attribute('console.healthcheck.action.steps')` - Steps necessary to create a measurable condition to test later
* `attribute('console.healthcheck.test.script')` - The path to the script that will host the health checks steps
* `attribute('console.healthcheck.test.command')` - The command in array format that will run the healthcheck - Defaults to the test script path
* `attribute('console.healthcheck.test.steps')` - Steps necessary to test the measurable condition to determine the health of the container
* `attribute('console.healthcheck.test.start_period')` - Defaults to 5s
* `attribute('console.healthcheck.test.interval')` - Defaults to 5s
* `attribute('console.healthcheck.test.timeout')` - Defaults to 3s
* `attribute('console.healthcheck.test.retries')` - Defaults to 10

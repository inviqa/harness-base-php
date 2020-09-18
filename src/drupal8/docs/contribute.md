# Contributing to the Drupal 8 harness

Clone the project from [harness-base-php]:
```bash
git clone git@github.com:inviqa/harness-base-php.git
```

## Make changes

Update the required files in `src/drupal8`, or if the change is relevant to all harnesses, `src/_base`.

## Testing your changes
```bash
./build && ./test drupal8 dynamic
```
This uses `src/drupal8/.ci/sample-dynamic/workspace.yml` so any attributes you want to test specifically can be changed here (but not committed)

### Pre-requisite
You will need to first export the `MY127WS_KEY` in order to run a build:
```
export MY127WS_KEY="<key>"
```

[harness-base-php](https://github.com/inviqa/harness-base-php)

# Contributing to the Drupal 8 harness

Clone the project:
```
git clone git@github.com:inviqa/harness-base-php.git
```

## Make changes
Update the required files in `src/drupal8`

## Testing your changes
```
./build && ./test drupal8 dynamic
```

### Pre-requisite 
You will need to first export the `MY127WS_KEY`:
```
export MY127WS_KEY="<key>"
```

This uses `src/drupal8/.ci/sample-dynamic/workspace.yml` so any attributes you want to test specifically can be changed here (but not committed)

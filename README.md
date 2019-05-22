# Harness Base PHP

## Testing

### Static mode

1. run `./build`
2. Clone https://github.com/inviqa/<framework>-sample in a test directory
3. Copy the built version of harness-base-php's ``./dist/<framework>`` dir to `<framework>-sample/.my127ws` directory
4. update the override file in `<framework>-sample`:
```bash
echo 'attribute(\'docker-sync\'): off' > workspace.override.yml
```
5. cd `<framework>-sample`
6. run in `pipeline` mode to activate `static` mode:
```bash
MY127WS_ENV=pipeline ws install
```

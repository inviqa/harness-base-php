# Harness Base PHP

## Testing

### Static mode

1. run `./build`
2. create and cd a tests directory
```bash
mkdir tests
cd tests
ws create <framework>-test inviqa/<framework> --no-install
```
3. Copy the built version of harness-base-php's ``./dist/<framework>`` dir to `<framework>-test/.my127ws` directory
```bash
cp -pR ../dist/harness-<framework>/ <framework>-test/.my127ws/
```
4. change directory to `<framework>-test`
```bash
cd `<framework>-test`
```
5. update the override file in `<framework>-test`:
```bash
echo 'attribute(\'docker-sync\'): off' >> workspace.override.yml
```
6. run in `pipeline` mode to activate `static` mode
```bash
MY127WS_ENV=pipeline ws install
```

# Adding custom commands

Adding commands can help with productivity and to standardise tasks.  
Information on writing commands can be found [here](https://github.com/my127/workspace/blob/0.1.x/docs/types/command.md)

There are also a number of [default commands](https://github.com/inviqa/harness-base-php/blob/2.0.x/src/_base/harness/config/commands.yml) available that may already provide the functionality you require.

If not, here are some example that might be a good starting point.

### Refresh script - `ws drupal-refresh`
```yaml
command('drupal-refresh'): |
  #!bash(workspace:/)|@
  echo "Running drupal-refresh"
  ws composer install
  ws drush -y cr
  ws drush -y updb
  ws frontend install
```

### Sanitise the DB - `ws sanitise-db`
```yaml
command('sanitise-db'): |
  #!bash|=
  echo "Running sanitise-db"
  ws drush sql-sanitize --sanitize-password=password -y
  ws drush uublk 1
  ws drush uli
```

### Database import - `ws import-db @drush.alias path/to/db.sql`
```yaml
command('import-db <alias> <database>'):
  env:
    ALIAS: = input.argument('alias')
    DB_FILE: = input.argument('database')
  exec: |
    #!bash(workspace:/)|=
    ws drush ${ALIAS} "sqlc < $DB_FILE"
```

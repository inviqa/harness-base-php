# Adding custom commands

Adding commands can help with productivity and standardise tasks.  
Information on writing commands can be found [here](https://github.com/my127/workspace/blob/0.1.x/docs/types/command.md)

Here are some example that might be a good starting point.


### Refresh script - `ws drupal-refresh`
```yaml
command('drupal-refresh'):
  exec: |
    #!bash(workspace:/)|@
    ws composer install
    ws drush -y cr
    ws drush -y updb
    ws frontend install
```


### Database import - `ws import-db path/to/db.sql`
```yaml
command('drush-import-db <alias> <filename>'):
  exec: |
    #!bash|=
    database_filename="={ input.argument('filename') }"
    alias="={ input.argument('alias') }"
    ws drush $alias "sqlc < $database_filename"
```


### Frontend development - `ws frontend-start`
```yaml
attribute('frontend.path'): "/app/docroot/themes/custom/mytheme"

# ...

command('frontend-start'):
  exec: |
    #!bash(workspace:/)|@
    docker-compose exec -u build console bash -i -c 'cd @('frontend.path'); yarn dev'
```

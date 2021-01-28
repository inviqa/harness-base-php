# Overriding default configuration

The `workspace.yml` file provides a means of defining new configuration as well as overriding the defaults that the harness provides.  
More information can be found on the attribute type in the Workspace documentation [here](https://github.com/my127/workspace/blob/0.1.x/docs/types/attribute.md)

## Set an attribute value
Take a moment to see the attributes that are defined in the Drupal 8 [harness.yml]. These are built on the defaults from [common.yml] in the base harness.  
These can all be customised in `workspace.yml` using `attribute()`.

Here are some examples:
* Change the database name:
  ```yaml
  attribute('database.name'): 'mysite'
  ```
* Use a different PHP version:
  ```yaml
  attribute('php.version'): '7.2'
  ```
* You can use existing attributes to define others using [expressions](https://github.com/my127/workspace/blob/0.1.x/docs/types/attribute.md#attribute-expressions):
  ```yaml
  # Set the local URL to mysite.my127.site
  attribute('hostname'): = 'mysite.' ~ @('domain')
  ```

## Merge not override

Strictly speaking you are not actually overriding attributes but rather _merging_ with the defaults.

Take for example the `services` enabled in the Drupal 8 [harness.yml]:
```yaml
  services:
    - chrome
    - mysql
    - redis
```

If you wanted to enable only the `mysql` service you may think of adding the following to `workspace.yml`:
```yaml
attribute('services'):
  - mysql
```

However, this would ultimately end up as:
```yaml
  services:
    - mysql
    - mysql
    - redis
```

Instead, you will need to set the lines that you wish to remove to `NULL`, using `~`:
```yaml
attribute('services'):
  - ~
  - mysql
  - ~
```

## Steps[]
In [harness.yml] there are a number of `steps` defined, such as; `backend.build.steps`, `backend.install.steps` and `backend.migrate.steps`.  
You can find even more in [common.yml], e.g. `frontend.build.steps`.

When you see `steps`, there will more than likely be a `task` that defines how and when these steps are executed.

To understand more, take a look at the tasks in the `console` docker image [here](https://github.com/inviqa/harness-base-php/blob/1.1.x/src/_base/docker/image/console/root/lib/task)

[harness.yml]: ../../harness.yml
[common.yml]: https://github.com/inviqa/harness-base-php/blob/1.1.x/src/_base/harness/attributes/common.yml

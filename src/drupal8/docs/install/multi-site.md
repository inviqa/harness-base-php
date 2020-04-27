# Setting up a multi-site in Workspace

First you will need to follow the steps to set up a Workspace environment for either a [new project] or [existing project], which ever is relevant to your scenario.

You will now have a `workspace.yml` file in which you can define the site hostnames.

## Hostnames

```yaml
attribute('hostname_aliases'):
  - site-one
  - site-two
  - site-three
```

These will equate to:
* site-one.my127.site
* site-two.my127.site
* site-three.my127.site

## Init steps to create database
```yaml
attribute('backend.init.steps'):
  - mysql -h mysql -e "CREATE DATABASE site_one"
```

## Override welcome script 
```shell script
#!/bin/bash

function task_welcome()
{
    echo ""
    echo "Welcome!"
    echo "--------"
    echo "Loop through hosts here"
    echo "--------"
    echo "Username: admin"
    echo "Password: admin123"
    echo ""
}
```

## Sites.php

## Drush aliases

## Drupal console sites

[new project]: new-project.md
[existing project]: existing-project.md

# Setting up a multi-site in Workspace

First you will need to follow the steps to set up a Workspace environment for either a [new project] or [existing project], which ever is relevant to your scenario.

This guide assumes that you have an understanding of how to set Drupal up for multi-site use. More information can be found in the [official multi-site documentation](https://www.drupal.org/docs/8/multisite).

## Contents
* [Setting up the hostnames](#define-the-hostnames)
* [Create the individual databases](#creating-multiple-databases-during-install)
  * [Importing databases during install](#importing-databases-during-install)
* [Update sites.php](#update-sitesphp)
* [Update the Drupal settings]
* [Add drush aliases](#add-drush-aliases)
* [Allow write access for CI](#allow-directory-write-access-for-ci)


## Define the hostnames
At this point you should have at least a `workspace.yml` file in the project root.  
Here the hostnames for the multi-sites can be defined using the `hostname_aliases` attribute:
```yaml
attribute('hostname_aliases'):
  - site-one-projectname
  - site-two-projectname
  - site-three-projectname
```

These will have the `.my127.site` suffix added and will end up as:
* site-one-projectname.my127.site
* site-two-projectname.my127.site
* site-three-projectname.my127.site


## Creating multiple databases during install
_If you are using table prefixes rather than multiple databases then you can skip this section._

In order to use multiple databases, they will need to be created as part of the build process.  
In `workspace.yml`, use the `init` steps to create the new databases as well as update the database user permissions.  
```yaml
attribute('backend.init.steps'):
  - = 'mysql -u root --password=' ~ @('database.root_pass') ~ ' -e "GRANT ALL ON \\`%_site\\`.* TO \'' ~ @('database.user') ~ '\'@\'%\'"'
  - = 'mysql -u root --password=' ~ @('database.root_pass') ~ ' -e "CREATE DATABASE IF NOT EXISTS two_site"'
  - = 'mysql -u root --password=' ~ @('database.root_pass') ~ ' -e "CREATE DATABASE IF NOT EXISTS three_site"'
```
The first line assumes that the databases you create follow the naming convention of `<name>_site`.

You may have noticed that there is not a step to create a database for `one_site`. By default, a `drupal` database is created and so this can be used for the default site.  

Having the database named `drupal` doesn't make sense here, so update the name for consistency:
```yaml
attribute('database.name'): one_site
```


### Importing databases during install
If you want to import databases during the Workspace install you can do so in the backend init steps. However, please be aware that you **MUST** have the database files in place before running `ws install`.

```yaml
attribute('backend.init.steps'):
  - ... existing GRANT steps from above ...
  - DB_NAME=two_site task assets:apply
  - DB_NAME=three_site task assets:apply
```

The database dumps should be located in `tools/assets/development`, ensuring that the filename is the same as the database name that you defined in the previous step:
```
project-root/
├- ...
└- tools/
.  └- assets/
.  .  └- development/
.  .  .  ├- one_site.sql.gz   
.  .  .  ├- two_site.sql.gz
.  .  .  └- three_site.sql.gz
```

## Update `sites.php`
You will need to ensure that Drupal knows which site to serve when you visit a valid domain. `<drupalRoot>/sites/sites.php` should be updated to include the new Workspace URLs:
```php
$sites['site-one-projectname.my127.site'] = 'default';
$sites['site-two-projectname.my127.site'] = 'two';
$sites['site-three-projectname.my127.site'] = 'three';
```

## Update Drupal settings (`settings.local.php`)
A perfectly acceptable solution is to add a `settings.local.php` file manually to the appropriate site directory when setting up the project locally.  
However, using Workspace's overlay features it is possible automate this step. Better yet, it means that the local settings can be version controlled and provides continuity for developers.

To do this you will need to update the workspace declaration to define the `overlay` directory:
```yaml
workspace('multisite-example'):
  ...
  overlay: tools/workspace
```

The next step is to add the `settings.local.php` files to be copied over to the local environment. These will be located as follows:
```
project-root/
├- ...
└- tools/
.  └- workspace/
.  .  └- application/
.  .  .  └- overlay/
.  .  .  .  └- docroot/
.  .  .  .  .  └- sites/   
.  .  .  .  .  .  ├- default
.  .  .  .  .  .  ⎪  └- settings.local.php.twig - copy from .my127ws/application/overlay/settings.local.php.twig
.  .  .  .  .  .  ├- two
.  .  .  .  .  .  ⎪  └- settings.local.php
.  .  .  .  .  .  └- three
.  .  .  .  .  .  .  └- settings.local.php
```
If you would like to use twig to template the files then take a look at the [advanced customisation guide].

Before moving on, make sure that you have do the following:
* Update `settings.php` files to uncomment the code to include the `settings.local.php` file:
    ```php
    if (file_exists($app_root . '/' . $site_path . '/settings.local.php')) {
      include $app_root . '/' . $site_path . '/settings.local.php';
    }
    ```
* Ensure that the `settings.local.php` files are excluded from version control in `.gitignore`.
* The `trusted_host_patterns` pattern is updated in `settings.php` or `settings.local.php`:
    ```php
    $settings['trusted_host_patterns'][] = '.*\.my127\.site$';
    ```

## Add Drush aliases
Assuming you have followed the steps to [Update the Drupal settings] you will have already updated `workspace.yml` to define the `overlay` directory and have the following folder structure: `tools/workspace/application/overlay/docroot`.

Inside this directory you will need to add the `drush/sites/` folder. Here you can create your site configuration files as per the [drush documentation](https://docs.drush.org/en/master/usage/#site-aliases).

You can create a new file for each site, or a cleaner approach may be to just define your aliases in a single file.

E.g. `ws.site.yml`:
```yaml
one:
  root: /app/docroot
  uri: https://site-one-projectname.my127.site
two:
  root: /app/docroot
  uri: https://site-two-projectname.my127.site
three:
  root: /app/docroot
  uri: https://site-three-projectname.my127.site
```
Take a look at the [advanced customisation guide] for more ideas on how to improve on this.

## Allow directory write access for CI
This is only really relevant if you're using the Jenkins or pipelines CI environments.

Update the defaults to include the multisite files directories.
```yaml
attribute('app.web_writable_dirs'):
  - '/app/config'                       # ⎤
  - '/app/docroot/modules'              # ⎪ These are the defaults
  - '/app/docroot/profiles'             # ⎪ from the Drupal 8 harness.yml
  - '/app/docroot/sites/default/files'  # ⎦
  - '/app/docroot/sites/one/files'
  - '/app/docroot/sites/two/files'
  - '/app/docroot/sites/three/files'
```

[new project]: new-project.md
[existing project]: existing-project.md
[advanced customisation guide]: ../customise/advanced.md#use-twig-temples
[Update the Drupal settings]: #update-drupal-settings-settingslocalphp

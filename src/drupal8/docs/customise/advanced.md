# Advanced customisation

There may be times when you need to customise the Workspace environment beyond what is capable via attribute overrides.  

 In these situations, if the customisation can be generalised then please look at the [contributing guide] on how to make the feature available for all projects.


## Adding a new service
If you need a service that isn't already provided (see [available base services](https://github.com/inviqa/harness-base-php/blob/0.10.x/src/_base/_twig/docker-compose.yml/service)) then you can register a new service following the [docker-compose](https://docs.docker.com/compose/compose-file/) notation.

Create your new service file in the `tools/workspace/_twig/docker-compose.yml/service/` directory.  

See the example `solr.yml.twig` service file below. Note the indentation, this is deliberate and must be followed to avoid docker-compose errors.
```yaml
  solr:
    image: {{ @('services.solr.image') }}
    labels:
      - traefik.backend=solr{{ @('workspace.name') }}
      - traefik.frontend.rule=Host:solr-{{ @('hostname') }}
      - traefik.docker.network=my127ws
      - traefik.port=8983
    volumes:
      - ./{{ @('solr.config_dir') }}:/solr-config/conf
    command:
      - solr-precreate
      - d8
      - /solr-config
    networks:
      - private
      - shared
    ports:
      - 8900
```

The `workspace.yml` file will also need to be updated to use the new service and define the new attributes used in `solr.yml.twig`:
```yaml
attribute('app.services'):
  - chrome
  - mysql
  - redis
  - solr

attribute('services.solr.image'): "solr:6-slim"
attribute('solr.config_dir'): = @('drupal.docroot') ~ '/modules/contrib/search_api_solr/solr-conf/6.x'
```


## Use twig temples
When overriding harness files or adding application overlay files using twig templates can be valuable for providing access to Workspace attributes. Not only this but you will have the power of [twig] at your fingertips.

To use a twig template there are 2 key steps;
* First create your file and append `.twig` to the filename.
* Second, register your file within `confd.yml` to be compiled by the twig render method.

Let's work through an example for adding drush aliases based on a list of multi-site domains.  
Keep in mind that in `workspace.yml` we have defined our hostnames as follows:
```yaml
attribute('hostname_aliases'):
  - site-one-projectname
  - site-two-projectname
  - site-three-projectname
```

### Create the template file
First off we want to create our new file, `ws.site.yml.twig`. The goal is for this to be compiled to `ws.site.yml`

Create the new file in `tools/workspace/application/overlay/docroot/drush/sites/` with the following contents:
```twig
{%- set sites = @('hostname_aliases')|map(alias => {hostname: alias, name: alias[5:]}) -%}

{% for site in sites %}
{{ site.name }}:
  root: /app/{{ @('drupal.docroot') }}
  uri: https://{{ site.hostname }}.my127.site
{% endfor %}
```
Notice the syntax to reference Workspace attributes: `@('<attribute.name>')`

### Register the new template
Now the file exists, but it won't be compiled until it has been registered. This is done in `confd.yml`.  
More information on the `confd` type can be found [here](https://github.com/my127/workspace/blob/0.1.x/docs/types/confd.md)

To update the file we will need to override the defaults.  
Create the `confd` override in following folder structure:
```
tools/workspace/harness/config/confd.yml
```

Make sure you copy the default configuration from the relevant harness.   
The Drupal 8 defaults can be found [here](../../harness/config/confd.yml)

Adding the new file path will look like this:
```yaml
confd('harness:/'):
  ...existing files...
  # Custom templates
  - { src: application/overlay/docroot/drush/sites/ws.site.yml }
```

[contributing guide]: ../contribute.md
[twig]: https://twig.symfony.com/doc/3.x/

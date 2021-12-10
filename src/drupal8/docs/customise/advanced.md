# Advanced customisation

There may be times when you need to customise the Workspace environment beyond what is capable via attribute overrides.  

 In these situations, if the customisation can be generalised then please look at the [contributing guide] on how to make the feature available for all projects.


## Adding a new service

If you need a service that isn't already provided (see [available base services](https://github.com/inviqa/harness-base-php/blob/1.3.x/src/_base/_twig/docker-compose.yml/service)) then you can register a new service following the [docker-compose](https://docs.docker.com/compose/compose-file/) notation.

Create your new service file in the `tools/workspace/_twig/docker-compose.yml/service/` directory.  

See the example `example.yml.twig` service file below. Note the indentation, this is deliberate and must be followed to avoid docker-compose errors.
```yaml
  example:
    image: {{ @('services.example.image') }}
    networks:
      - private
```

The `workspace.yml` file will also need to be updated to use the new service and define the new attributes used in `example.yml.twig`:
```yaml
attribute('services.example.enabled'): true
attribute('services.example.image'): "my127/example:tag"
```

## Adding Solr

Opt in to using solr with the following in your workspace.yml:
```yaml
attribute('services.solr.enabled'): true
```

If you need to use an older version than v8, set the major version like so. It is recommended to use an officially
supported version (see list of tags at [solr's docker hub page]):
```yaml
attribute('services.solr.major_version'): 7
```
This will cause the docker image chosen to be `solr:<major_version>-slim` - i.e. the latest minor version available.
If you need a specific minor version you can overwrite the docker image attribute directly:
```yaml
attribute('services.solr.image'): solr:8.4-slim
```

This will automatically create a `collection1` solr core for use in the project. If you need a custom name for the
core, you can set:
```yaml
attribute('services.solr.environment.SOLR_CORE_NAME'): example_core_name
```

If you have a pre-existing configuration that should be applied when creating this core, you can configure it like so,
with a path relative to the project root:
```yaml
attribute('services.solr.config_path'): path/to/config/directory/
```

There is a special case if the version required is v4, which is not present on the officially supported versions list.
It's not recommended to use this version as it is unmaintained, but there are some large cloud providers that do not
support newer versions.

To support v4, we build a custom docker image based on the official v5 image, and overwrite the solr installation with
the unsupported version.

## Adding Varnish

Opt in to using varnish with the following in your workspace.yml:
```yaml
attribute('services.varnish.enabled'): true
```

To apply changes to your local environment, run `ws harness prepare && docker-compose up -d`.

The harness ships with a version of the [geerlingguy/drupal-vm Varnish VCL], which supports the `purge_varnish` module as well as only allowing certain cookies to impact cachability of requests.

Acquia ships with varnish enabled by default and has a custom Varnish VCL.

The VCL configuration shipped in the harness can be used to try to replicate what is used in Acquia, but you should enable the `acquia_purge` module for Acquia environments.

### Caching Content

To have content cached, we need to tune drupal to allow anonymous requests for pages to be cached.

As an admin, visit `/admin/config/development/performance` to set "Browser and proxy cache maximum age" to a value other than "none", e.g. "1 hour"

Alternatively you can edit `config/sync/system.performance.yml` to specify the number of seconds to cache for, and import the configuration:
```yaml
cache:
  page:
    max_age: 3600
```

Note that this also means to cache in browsers for the time specified in addition to varnish (so if you specify one hour, it can take two hours for people to receive updated content).

This time increases further if you have additional proxy caches such as Cloudflare in between the browser and varnish that are set to cache HTML content.

See "Cache in browsers for less time than Varnish and other proxy caches" below for how to avoid this.

#### Testing

Verify with `curl` that pages are now cacheable in varnish and browsers:
```bash
curl --silent --head --request GET https://project-name.my127.site/ | grep -iE '^(HTTP/|age|cache-control)'
```
If successful, repeated calls to curl should give the following headers, with age increasing based on the time in seconds since cached:
```
HTTP/2 200
age: 118
cache-control: max-age=3600, public
```

### Purging Content On Changes

By default, varnish will cache content for your desired time period and not reflect changes for anonymous visits
until the time period expires.

In the case of short time periods, this may be fine, but Drupal's Cache Tags system allows us to purge varnish when a node (or even a block used in a node) is updated.

To configure this, enable the following modules:
- purge
- purge_drush
- purge_processor_cron
- purge_processor_lateruntime
- purge_queuer_coretags
- purge_ui
- varnish_purge_tags
- varnish_purger

A purger will need to be set up at `/admin/config/development/performance/purge`.

Add a "Varnish" purger and configure it:
* Type "Tag" (the default)
* Request should be to hostname `varnish`, port `80`, path `/`, request method `BAN`, scheme `http`
* Headers should be `Cache-Tags` mapped to `[invalidation:expression]`

#### Testing

Test that the purger queue is working by testing with `curl` that a page is still cacheable in varnish and browsers:
```bash
curl --silent --head --request GET https://project-name.my127.site/ | grep -iE '^(HTTP/|age|cache-control)'
HTTP/2 200
age: 118
cache-control: max-age=3600, public
```

You can also verify that varnish receives a `BAN` request with the following varnishlog query:
```bash
docker-compose exec varnish varnishlog -q 'ReqMethod ~ BAN'
```

Now edit the homepage. Once you hit the Save button on the edit page, varnish should receive a ban request through.

Repeating the curl request should show an `age` header that is lower than before.

### Cache in browsers for less time than Varnish and other proxy caches

Enable the `http_cache_control` module, which allows you to configure browser based caching separately from proxy based caching.

Assuming there aren't any further proxy caches (e.g. Cloudflare) in front of varnish, you can increase the s-maxage
setting to a very high value (even a year!), as with the purge_varnish module working, varnish will be kept up to
date with changes automatically. Browsers will check in with varnish each time the browser cache (max-age) expires.

s-maxage time periods over a day will need [this issue's patch], but do read the comments.

If you do have other proxy caches in front of varnish, you will either have to purge the upstream proxy cache with
another purge plugin, or keep the s-maxage setting low as with a s-maxage of 1 month, it can take 2 months for
visitors to be able to see changes!

With control over the varnish VCL, it should be possible to alter the cache-control header in the response to the upstream proxy to lower the `s-maxage` value, but keeping the high "ttl" in terms of storage in varnish.

The following VCL snippet does this - if s-maxage is present in the cache-control header in the response from
varnish and it's over 100 seconds, it is reset to 100 seconds.
Varnish will keep the object in cache for the original s-maxage value, or until purged.
```vcl
import std;
sub vcl_deliver {
    # Respond to upstream proxies with a lower s-maxage
    if (resp.http.cache-control && std.integer(regsub(resp.http.cache-control,
"(^|.*,)(\s*)s-maxage=([0-9]+)(\s*)(,.*|$)", "\3"), 0) > 100) {
        set resp.http.cache-control = regsub(resp.http.cache-control,
"(^|.*,)(\s*)s-maxage=([0-9]+)(\s*)(,.*|$)", "\1\2s-maxage=100\4\5");
    }
}
```

This VCL snippet can be activated in the harness by setting `attribute('varnish.response.s-maxage'): 100`.

#### Testing

Again with curl, check that there's a cache-control header and an age that is increasing, meaning it's in cache.
The max-age setting should reflect your "browser cache" time in seconds, and `s-maxage` should reflect your "proxy cache" time in seconds.
```bash
curl --silent --head --request GET https://project-name.my127.site/ | grep -iE '^(HTTP/|age|cache-control)'
HTTP/2 200
age: 12
cache-control: max-age=300, public, s-maxage=3600, stale-if-error=1800, stale-while-revalidate=60
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
[solr's docker hub page]: https://hub.docker.com/_/solr
[geerlingguy/drupal-vm Varnish VCL]: https://github.com/geerlingguy/drupal-vm/blob/master/provisioning/templates/drupalvm.vcl.j2
[this issue's patch]: https://www.drupal.org/project/http_cache_control/issues/3173020

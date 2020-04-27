# Override the Drupal install steps
In `workspace.yml` you can define your own install steps overriding the `backend.install.steps` attribute:
```yaml
attribute('backend.install.steps'):
  - task "overlay:apply"
  - run "composer install"
  - run "drush @all si minimal -y --account-name=admin --account-pass=admin123"
```
Look at [harness.yml](../../harness.yml) to see the defaults

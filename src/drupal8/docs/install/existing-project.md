# Setting up Workspace on an existing project

1. To add Workspace to an existing project, the easiest way to do this is to first change to the project directory:
    ```
    cd /path/to/project
    ```
    From here, run the `ws create` command, but don't run the installation:
    ```
    ws create <projectName> inviqa/drupal8:<version>
    ```
    (Note: see [harnesses.json] for available versions.)

2. You will now have a new directory, `<projectName>` containing a number of files and folders. We don't need to be concerned with all of them.
    
    The following files are unlikely to already exist in the current project, if they do then you will need to review them and merge/override appropriately:
    * `workspace.yml`
    * `workspace.override.yml`
    * `features/`
    * `behat.yml`
    * `Jenkinsfile`
    * `phpstan.neon`
    
    Move these from `<projectName>` into the project root.

3. There will be some files that more than likely already exist in the project. These will need to be merged manually.
    * `.gitignore`
    * `composer.json`
        * Specifically the `require-dev` and `scripts` sections.
    * `README.md`

4. You can now delete the initial `<projectName>` folder:
    ```
    rm -r <projectName>
    ```

5. Run `ws install` to set up the workspace.

6. Follow steps 2. and 5. from the [New project] install guide.

[harnesses.json]: https://my127.io/workspace/harnesses.json
[New project]: new-project.md

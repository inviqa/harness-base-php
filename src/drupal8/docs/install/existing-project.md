# Setting up Workspace on an existing project

1. To add Workspace to an existing project, the easiest way to do this is to first change to the project directory:
    ```bash
    cd /path/to/project
    ```
    From here, run the `ws create` command, but don't run the installation:
    ```bash
    ws create <projectName> inviqa/drupal8:v0.10.1 --no-install
    ```
    (Note: see [harnesses.json] for available versions.)

2.  You will now have a new directory, `<projectName>` containing a number of files and folders.

    To be able to continue, we need to get to the point that the "skeleton" and "overlay" is applied,
    so we can copy to our original project:
    ```bash
    cd <projectName>
    git init
    ws harness download
    ws harness prepare
    rsync --exclude='*.twig' --exclude='_twig' -a .my127ws/application/skeleton/ .
    rsync --exclude='*.twig' --exclude='_twig' -a .my127ws/application/overlay/ .
    ```

3. We should be left with several folders and files from the harness skeleton.

    You can see the list with `git status`.

    The following files are unlikely to already exist in the current project, if they do then you will need to review them and merge/override appropriately:
    * `workspace.yml`
    * `workspace.override.yml` - this will be in .gitignore, so won't show up in `git status`
    * `Jenkinsfile`
    * `behat.yml`
    * `features/`
    * `phpstan.neon`

    Move these from `<projectName>` into the project root.

4. There will be some files that more than likely already exist in the project. These will need to be merged manually.
    * `.gitignore`
    * `composer.json`
        * Specifically the `require-dev` and `scripts` sections.
    * `README.md`

5. You can now delete the initial `<projectName>` folder:
    ```
    rm -r <projectName>
    ```

6. Run `ws install` to set up the workspace.

7. Follow steps 2. and 5. from the [New project] install guide.

[harnesses.json]: https://my127.io/workspace/harnesses.json
[New project]: new-project.md

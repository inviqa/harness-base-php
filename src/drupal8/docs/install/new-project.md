# Setting up Workspace on a new project
1. Use the `create` command to create a new project with the Drupal harness:
    ```
    ws create <projectName> inviqa/drupal8:v0.10.0
    ```  
    (Note: see [harnesses.json] for available versions.)

    E.g.  
    ```
    ws create testProject inviqa/drupal8:v0.10.0
    ```  
    This will create the new project in the current directory.

2. Fill in project-specific AWS and Github credentials, set as blank if you don't need them.

3. Change to the directory:
   ```
   cd <projectName>
   ```

4. Create an initial commit, ensuring that `workspace.override.yml` is not added to git:
    ```bash
    git init
    git add .
    git commit -m "Initial commit"
    ```
5. As part of the install, an `workspace.override.yml` file will be created with project key. E.g.
    ```
    key('default'): 30f672......
   ```
   Copy the key value to a suitable location (such as LastPass).

[harnesses.json]: https://my127.io/workspace/harnesses.json

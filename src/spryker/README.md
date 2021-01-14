# Spryker Harness for [Workspace]

To use this harness:

1. Install [Workspace]
2. Run `ws create <projectName> inviqa/spryker:v0.12.0`
3. Fill in project-specific AWS and Github credentials, set as blank if you don't need them
4. Change to the <projectName> directory: `cd <projectName>`
5. Create an initial commit, ensuring that `workspace.override.yml` is not added to git:
```bash
git init
git add .
git commit -m "Initial commit"
```
6. Store the `workspace.override.yml` contents in a suitable location (such as LastPass).

To generate and encrypt secrets for pipeline environments: 
https://github.com/inviqa/k8s-project-cluster/blob/0.1.x-dev/docs/cluster-management/sealed-secrets/README.md

[Workspace]: https://github.com/my127/workspace

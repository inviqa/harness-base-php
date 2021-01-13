# Akeneo Harness for [Workspace]

To use this harness, you will be asked if you wish to install the enterprise edition, which requires a subscription
with Akeneo, or use the community edition which is open source.

## Community Edition

1. Install [Workspace]
2. Run `ws create <projectName> inviqa/akeneo:v0.12.0`
3. You will be asked a series of questions:
  - For `akeneo.edition`, enter `community`
  - For `akeneo.enterprise.distribution.project_name`, press enter to submit a blank string
  - For `ssh.key.private`, press enter to submit a blank string
  - For `File to read for ssh.key.public`, press enter to submit a blank string
4. Change to the <projectName> directory: `cd <projectName>`
5. Create an initial commit, ensuring that `workspace.override.yml` is not added to git:
```bash
git init
git add .
git commit -m "Initial commit"
```
6. Store the `workspace.override.yml` contents in a suitable location (such as LastPass).

## Enterprise Edition

### Prerequisites

- A valid subscription with Akeneo to gain access to the enterprise edition codebase.
- A dedicated user in the Akeneo Portal for the purposes of installing the enterprise edition with composer.
  https://help.akeneo.com/portal/articles/get-akeneo-pim-enterprise-archive.html
- A public and private SSH keypair generated for the purposes of installing the codebase, with the public
  key associated with the dedicated user in the Akeneo Portal.

### Installation

1. Install [Workspace]
2. Run `ws create <projectName> inviqa/akeneo:v0.12.0`
3. You will be asked a series of questions:
  - For `akeneo.edition`, enter `enterprise`
  - For `akeneo.enterprise.distribution.project_name`, enter the "Git repository" name listed on the Akeneo Portal
  - For `ssh.key.public`, enter the public SSH key associated with the Akeneo Portal's dedicated user.
  - For `File path to read for ssh.key.private`, enter the path to a private SSH key associated with the Akeneo Portal's dedicated user.
4. Change to the <projectName> directory: `cd <projectName>`
5. Create an initial commit, ensuring that `workspace.override.yml` is not added to git:
```bash
git init
git add .
git commit -m "Initial commit"
```
6. Store the `workspace.override.yml` contents in a suitable location (such as LastPass).

[Workspace]: https://github.com/my127/workspace

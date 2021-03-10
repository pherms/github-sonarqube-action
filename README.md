# SonarQube action for github

This action provides SonarQube code scanning to your project.
SonarQube scans your code for vulnerabilities, bugs and codesmells in more than 20 programming languages.

SonarQube is an open-source platform, developed by SOnarsource.

This action does not support SonarCloud!

## Requirements
* An installed SonarQube instance (CE, Developer or Enterprise instance)

## Usage
The Github workflow is usually declared in .github/workflow/main.yml. A minimal setup looks like this:

```yaml
on: push
name: Workflow name
jobs:
  SonarQubeTrigger:
    name: SonarQube Trigger
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master #have a look at this
    - name: SonarQube Scan
      uses: pherms/sonarqube-action
      with:
        host: ${{ secrets.SONARQUBE_HOST }}
        login: ${{ secrets.SONARQUBE_TOKEN }}
```
SONARQUBE_HOST and SONARQUBE_TOKEN are secrets which you configure in your repositories secrets. You can find them under Settings - Secrets.

When you pre-provision a project in SonarQube, you can specify a project key.
You can make sure the github action runs the analysis on the pre-provisioned project, by specifying the project key in the with: block of the yaml as shown in the code block below.
```yaml
with:
  projectKey: my-custom-project-key
```

## Secrets and other variables
Secrets can be set in Github in the "Secrets" settings page of your repository
the following variables can be used:
- host: URL of the SonarQube instance (required)
- login: the login name or token of a SonarQube user that is allowed to perform an analysis (required)
- password: the password of a SonarQube user. Should be left blank if a login uses a token (optional)
- projectKey: the projectkey of a project (optional)

## License


**_Container images built with this project include third party components._**
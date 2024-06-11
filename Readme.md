# Intersystems Build System

## Purpose
This repo serves as a template.

The idea is that is easily accesible for critique or improvement.

## Dependencies
* POWERSHELL
* DOCKER
* GITHUB repo
    * Gitlab will come later

### How it works with git
```
                             ,---------------------------------.
                             |Github Action                    |
                             |---------------------------------|
        ,----------------.   |* Checks out code                |
,----.  |Github          |   |* Starts Intersystems            |
|User|  |----------------|   |* Imports Code                   |
|----|--|* Checks for tag|---|* Runs Builder script            |
`----'  |* Starts Action |   |* Exports the build              |
        `----------------'   |* Copies from docker back to host|
                             |* Creates a release              |
                             `---------------------------------'
```

# Skaffold

Skaffold is a "Continuous Development" tool to enable sharing development environments.


## Development

In it's most common use case skaffold outlines how to build a set of containers, and how to deploy them utilizing a yaml file.
A command such as `skaffold dev` is run which will watch for file changes for a docker container, and when it sees them, rebuild and redeploy the container as the file changes occur.

This provides a quick inner loop for kubernetes development.

## Init

`skaffold init` is a command to initialize skaffold on a project.
It will require some kubernetes manifests to be generated to get started.
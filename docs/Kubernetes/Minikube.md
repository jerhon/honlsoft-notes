# Minikube

Minikube is a distribution of kubernetes that can be run on a single machine.

## Installation

On Windows if it's running on Hyper-V, you need to be a member of the `Hyper-V Administrators` group in order to use it.

## Starting

`minikube start` will setup and run the initial VM.  Make sure to do this as your regular user and make sure to apply the Hyper-V Administrator's rights beforehand.

## Building Images

This is the same syntax as Docker.
In the same directory do this:

`minikube build image . -t [image-name:tag]`

It can then be run.

`kubectl run [pod-name] --image=[image-name:tag] --image-pull-policy=IfNotPresent`

The main issue here is when using the latest tag on an image, or don't supply a tag.
Kubernetes defaults the pull policy to `Always` which will cause the image to fail as it doesn't exist in the docker container registry.
Or --- worse, maybe it does exist with the same name but a different image, but get's downloaded in the k8s cluster.
`IfNotPresent` will only try to download the image if it doesn't exist.
`Never` would never pull the image.

## Accessing Pods

### Port Forward

To simply forward a port from a pod, can use standard kubernetes port forwarding.

`kubectl port-forward pod/image-name [local-port]:[remote-port]`

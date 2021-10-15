# Storage in Kubernetes

Store application state and exchange it between Pods with Kubernetes.

## Volumes

A volume can be used to hold data and state for a container.
A pod cna have multiple volumes.
Containers rely on a mountPath to access a volume.

A volume references a storage location.
Must have a unique name.
Attached to a pod and may or may not tied to the pods lifetime depending on the type of storage.



PersistentVolume
PersistentVolumeClaim
StorageClass


## Volume Types

* emptyDir - Stores transient data (shares a pod's lifetime)
* hostPath - Pod mounts into the node's filesystem



* nfs - An NFS share from the network mounted on the Pod
* configMap/secret
* persistentVolumeClaim - provides pods with a more persistent storage option
* Cloud

## Host Path

Can access various different types of resources on the server based on file access.

* DirectoryOrCreate
* Directory
* FileOrCreate
* File
* Socket
* CharDevice
* BlockDevice
... etc ...

## Kubectl

The describe command will list the volumes for the pod.

```kubectl describe pod [pod-name]```



## PersistentVolume

A cluster-wide storage resource that relies on network-attached storage.
Normally provisioned by a cluster administrator.
Available to a Pod even if it gets rescheduled to a different Node.
Rely on a storage provider such as NFS, cloud storage, or other options.

PersistentVolumeClaim - claims the storage so that a Pod can use it.


### Process
1. Create a network storage resource (NFS, cloud, etc)
2. Define a persistent volume that links kubernetes to the storage
3. Create a PVC which links the pod to the persistent volume.


### YAML

GitHub site with lots of examples:

TODO: Add it here...

## Storage Class

Sets up to automatically provision persistent volumes.

1. Create Storage Class
2. Create a PVC that references a storage class
3. Persistent Volume is automatically created
4. PV is automatically bound
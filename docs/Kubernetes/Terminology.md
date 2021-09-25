# Terminology Cheat Sheet

* Pod - Basic unit of execution in Kubernetes.
* Container - An application bundled with all it's dependencies typically run in an isolated environment from other processes.
* Deployment - An abstraction on top of a ReplicaSet which can handle bringing up and down pods based on configuration changes.
* ReplicaSet - A resource which handles scaling up a pod to multiple instances.

* Context - A cluster, user, and namespace combination used when accessing a K8s cluster.

* Master Node
* Store
* Controller Manager
* Scheduler

* API Server - Used to manage kubernetes resources.  Used by kubectl to manage the cluster.
Each Node
* Kubelet
* Container Runtime
* Kube proxy


## Networking
* Service - A single point of entry for accessing one or more pods.
* NodePort - A type of service where a port is exposed on every node in the cluster and redirects traffic to the service.
* ClusterIP - A type of service where it is exposed internally on an IP address only available in the kubernetes cluster
* ExternalName - An alias for an external service which can than be accessed through a friendly name in the cluster.
* LoadBalancer - A type of service where it is loadbalanced and available on a publicly accessible IP through a load balancer.
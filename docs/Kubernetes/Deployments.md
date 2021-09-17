# Deployments

Deployments and ReplicaSets ensure Pods stay running with the proper number.

# ReplicaSet
ReplicaSets act as a Pod controller

* Self-healing
* Ensure the request number off pods are running
* fault taulerance
* scale pods
* relies on Pod
* handles creation of Pods
* Used by deployments

Once a replicaset is created, it will bring up pods to match the desired level of pods.
Uses ReplicaSets to handle
Deployment
ReplicaSet
Like a hierarchy the
Container -> Pod -> ReplicaSet -> Deployment

# Difference from Deployments
Scales ReplicaSets
Supports zero-downtime updates by creating and destroying replicasets
Rollback functionality
Creates unique label that is assigned to the replicaset and generated pods
YAML is very similar between ReplicaSet vs Deployment


# Command Line

```
kubectl get deployment --show-labels
kubectl delete deployment [name]

kubectl scale deployment [deployment-name] --replicas=5
```

Resource limits are important! Otherwise they can take over the node.

in general you can use the name or -f to identify a particular deployment to work on.

# Deployment Types

Zero downtime
Update the pods without impacting end uesrs

## Rolling Update
Bring up a new pod one at a time, getting rid of the older one immediately after creating the new pod.
Automatically happens with kubectl apply -f file.deployment.yml

## Blue-green deployments
Multiple environments (pods), switch traffic over once it's good

## Canary deployments
Small amount of traffic, once it's been verified it's ok, then route the rest of the traffic.

# Rollbacks



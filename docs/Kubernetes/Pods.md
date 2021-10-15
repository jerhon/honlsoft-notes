# Pods
Basic unit of a Kubernetes application-the smallest and simplest unit in the Kubernetes object model that you create or deploy.

Can have 1 or more containers.
Used to organize applications into seperate units.

Has IP, memory, volumes, shared across containers in a single pod.
They live and die, but don't come back to life- they are replaced.

Containers within a pod
* share the same network namespace (IP / port)
* have the same loopback inteface (localhost)

Need to be bound to different ports (can't have both access port 80 for example)
Ports can be reused by containers in different pods.
Each pod has a seperate IP address.

Pod and it's containers are run on a single K8s node.
They are not split up onto seperate nodes if a Pod has more than one container.

## Containers

Ready to run software package containing all it needs to run: application, system libraries, etc.
Containers run on a runtime which Kubernetes uses.
K8s supports several such as Docker, containerd, CRI-O

### Container Images

The packaged up application and it's dependencies.
It's essentially the 'executable' for K8s.
Container images are pushed to in a registry where K8s can pull them.

They are usually named like webapplication or honlsoft/webapplication or with a hostname for the registry fictional.registry.example/honlsoft/webapplication this can include a port as well.

Supports [A-Za-z0-9_.-]

Tags can be added to the end of images to differentiate between different image versions.

## Command Line

### Create a Pod
```
kubectl run nginx-pod --image=nginx:alpine
```

### Get the pods:
```
kubectl get pods
kubectl get all
```

### Port Forward

By default not accessible outside of the cluster until extra resources are defined.

Can port forward to access a pod that's not exposed to the network.
```
kubectl port-forward [name-of-pod] [external-port:pod-port]
```

### Delete a pod
```
kubectl delete [name-of-pod]
```
If the pod is deleted, it may be regenerated, you would need to delete the deployment.

### Delete a deployment
```
kubectl delete deployment [name-of-deployment]
```

### Describe
```
kubectl describe pod [pod-name]
```

Gets interesting things such as the events related to the POD.

## YAML

Sample YAML for simple nginx Pod

```yaml
apiVersion: v1
kind: Pod
metadata:
    name: nginx-pod
spec:
    containers:
    - name: nginx
      image: nginx:alpine
      ports:
      - containerPort: 80
        protocol: TCP
    livenessProbe:
        httpGet:
            path: /index.html
            port: 80
        initialDelaySeconds: 15
        timeoutSeconds: 2
        periodSeconds: 5
        failureThreshold: 3
```

Can output the associated YAML for a kubernetes resource.
For example, to get an existing pod's definition in YAML.

```
kubectl get pod nginx-pod -o yaml
```


## Probes

There are two types of probes:

A Liveliness Probe is that Pod is running.
A Readiness Probe is that the Pod is ready to be used.

* EXEC - Executes action inside the container.
* TCP - Attempts a connection to a port to ensure it is open.
* HTTP Get - Attempts to make an HTTP request to a specific path.  Response >= 200 and < 400 are considered successful.
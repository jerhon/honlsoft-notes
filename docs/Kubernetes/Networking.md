# Networking

## Service
A single point of entry for accessing one or more pods.
Pods are ephemeral, so can't rely on IP address.
There can be multiple instances of a Pod (horizontally scaled).

Service is a point to access to load balance between pods.
Kube-proxy handles it
Services are long-lived
Creates an endpoint which sits between the Service and the Pod

## Service Types
* ClusterIP - Expose the service on an internal IP
* NodePort - Expose the service on each Node's IP at a static port.
* LoadBalancer - Provision an external IP to act as a load balancer for the service
* ExternalName - Maps a serve to a DNS name

Cluster IP is internal
NodePort and LoadBalancer are for external access

### Cluster IP
Only the pods within the cluster can talk to the Service

### Node Port
Exposes the Service on each Node's IP at a static port
Allocates a port form a range (default is 30000-32767)
Each Node proxies the allocated port

### Load Balancer
Exposes a service externally
Usually combines with a cloud provider's load balancer
NodePort and ClusterIp Services are created

### External Name Service
Service that acts as an alias for an external service
Proxies request to an external service

## port-forwarding

By default can't access services outside of kubernetes.
Can port forward to different types of resources.

```
kubectl port-forward pod/[pod-name] 8080:80
kubectl port-forward deployment/[deployment-name] 8080:80
kubectl port-forward service/[service-name] 8080:80
```

## YAML Examples

```yaml
apiVersion: v1
kind: Service
metadata:
    name: nginx  # Name of service gets a DNS entry within the kubernetes cluster
    labels:
        app: nginx
spec:
    type: ClusterIP,NodePort,LoadBalancer
    selector:
        app: nginx # For pods / deployments with this label
    ports:
        - name: http
          port: 80
          targetPort: 80
```

Example of a node port:

```yaml
apiVersion: v1
kind: Service
metadata:
    name: nginx  # Name of service gets a DNS entry within the kubernetes cluster
    labels:
        app: nginx
spec:
    type: ClusterIP,NodePort,LoadBalancer
    selector:
        app: nginx # For pods / deployments with this label
    ports:
        - name: http
          port: 80
          targetPort: 80
          nodePort: 31000 # it will assign one dynamically, but we can specify it here
```

ExternalService

```yaml
apiVersion: v1
kind: Service
metadata:
    name: external-service
spec:
    type: ExternalName
    externalName: api.acmecorp.com
    ports:
    - port: 9000
```
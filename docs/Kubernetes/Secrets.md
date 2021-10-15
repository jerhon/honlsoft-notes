# Secrets

Stores sensitive information
Avoids storing in container images, files, or deployment manifests
Mount secrets into pods as files or environment variables
Kubernetes only makes secrets available to Nodes that have a Pod requesting the secret
Secrets are stored in tmpfs on a Node (not on disk)

## Best Practice
Enable encryption at rest for cluster data
Limit access to etcd (where Secrets are stored) to only admin users
Use TLS for etcd peer-to-peer communication
Mainifest (Yaml/JSON) files only base64 encode the secret
Pods can access secrets so secure which users can create pods.  RBAC can be used as well.


## Creating Secrets

```bash
# From a key/value
kubectl create secret generic [secret-name] --from-literal=pwd=password1234

# from a file
kubectl create secreat from generic secret --from-file=privatekey=~/.ssh/id_rsa

# TLS cert / key
kubectl create secret tls tls-secret --cert=path/to/tls.cert --key=path/to/tls.key
```

Need to be careful, these files are not secure.
Values are only base64 encoded.

```yaml
apiVersion: v1
kind: Secret
metadata:
    name: passwords
type: Opaque
data:
    db-password: [base64-encoded-string]
```

# ConfigMaps

A ConfigMap provides a way to store configuration information and provide it to containers.
A centralized way to store application configuration information.
Can get injected to a container.

Con store in a file or provide key/valu pairs
* Store in a file, key is the filname value is the file contents
* provide the values on the command-line
* ConfigMap manifest (yaml file)

Can be accessed by
* Environment Variables (key / value)
* ConfigMap Volume (access as files)

## Creating

ConfigMap manifest

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
    name: settings
data:
    hello: world
    setting2: value
```

Use `kubectl create` or `kubectl apply` to load.

### From k/v file

```env
hello=world
setting2=value
```

```
kubectl create configmap [name] --from-file=[path-to-file]
```

### From ENV file

```
kubectl create configmap [name] --from-env-file=[path-to-file]
```

### From Literal

```
kubectl create configmap [name] --from-literal=apiUrl=https://my-api --from-literal=otherKey=otherValue
```

### Get a configmap

Get a config map and output it as yaml.

```
kubectl get cm [name] -o yaml
```

# By File vs By Environment

By file, config values can auto-update
By env, injected in environment variables
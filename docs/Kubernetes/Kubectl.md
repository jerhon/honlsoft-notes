# Kubectl

Basic common commands.

```
kubectl version
kubectl cluster-info
kubectl get all
kubectl run [container-name] --image=[image-name]
kubectl port-forward [pod] [port]
kubectl expose
```

## Create a Resource from YAML

```
kubectl create

# Dry Run to Test YAML Before Applying
kubectl create -f file.pod.yml --dry-run
```

NOTE: Create works, but can be misused as the config needs to be saved to later apply it with the `--save-config` option.  It's best to just use `kubectl apply` instead to ensure it can

```
kubectl apply -f [filename]
```
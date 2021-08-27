
kubectl version
kubectl cluster-info
kubectl get all
kubectl run [container-name] --image=[image-name]
kubectl port-forward [pod] [port]
kubectl expose

# Create a Resource
```

kubectl create

# Dry Run to Test YAML Before Applying
kubectl create -f file.pod.yml --dry-run
```
need to use --save-config to use apply


kubectl apply


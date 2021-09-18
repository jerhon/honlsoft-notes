# YAML

Kubernetes resources are usually defined in YAML.

Typically applied in a cluster by running:
```
kubectl apply -f filename.yaml
```

## Selector vs Template

Selectors are used to pick out what to create through templates
Templates are concrete definitions of resources.
Typically something like a Pod.
Templates are usually labeled and then a selector is used to pick out the proper template with the label.

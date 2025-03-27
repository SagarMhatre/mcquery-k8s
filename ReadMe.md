
```sh
clear
NAMESPACE=mcq
kubectl get deployments --namespace=$NAMESPACE
kubectl get pods --namespace=$NAMESPACE
kubectl get services --namespace=$NAMESPACE


POD_NAME=
kubectl describe pod $POD_NAME --namespace=$NAMESPACE
kubectl logs $POD_NAME --namespace=$NAMESPACE

kubectl delete pod $POD_NAME --namespace=$NAMESPACE

```


## Installing

```sh

cd /Users/sagarmhatre/Documents/src/mcquery/mcquery-k8s
kubectl apply -f mcq-k8s.yaml

NAMESPACE=mcq
kubectl get deployments --namespace=$NAMESPACE
kubectl get pods --namespace=$NAMESPACE
kubectl get services --namespace=$NAMESPACE
kubectl top pods --namespace=$NAMESPACE
kubectl get hpa --namespace=$NAMESPACE

```

## HPA

The HPA requires resource requests to be set for the pods it is scaling. Ensure your deployment or pod in the mcq namespace has CPU requests defined.

### Adding the metrics server

```sh
# Apply the metrics server manifest
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

# kubectl delete -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

# Verify that the metrics server is running
kubectl get deployment metrics-server -n kube-system

# Check if metrics are available
kubectl top nodes
kubectl top pods --namespace=mcq
kubectl get hpa --namespace=mcq

```

```sh
git init
git add --all
git commit -m "Added HPA"
git branch -M main
git remote add origin https://github.com/SagarMhatre/mcquery-k8s.git
git push -u origin main
```

## ArgoCD

```sh
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Getting the password for admin
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode; echo

# Kubectl port-forwarding can  be used to connect to the API server without exposing the service.

kubectl port-forward svc/argocd-server -n argocd 8080:443

# OR Change the argocd-server service type to LoadBalancer:
# kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

# https://localhost:8080/  admin
# 1. Create Project with SOURCE REPOSITORY & DESTINATION
# 2. Add the Project
```
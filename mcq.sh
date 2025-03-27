clear
NAMESPACE=mcq
kubectl get deployments --namespace=$NAMESPACE
kubectl get pods --namespace=$NAMESPACE
kubectl get services --namespace=$NAMESPACE

POD_NAME=$(kubectl get pods --namespace=$NAMESPACE --no-headers -o custom-columns=":metadata.name")
POD_NAME=kong-migrations-cp76q 
kubectl describe pod $POD_NAME --namespace=$NAMESPACE
kubectl logs $POD_NAME --namespace=$NAMESPACE

kubectl delete pod $POD_NAME --namespace=$NAMESPACE

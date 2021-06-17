#!/bin/bash

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.46.0/deploy/static/provider/baremetal/deploy.yaml
echo "Wait for NGINX ingress pods to complete"
sleep 15 
kubectl get pods -n ingress-nginx   -l app.kubernetes.io/name=ingress-nginx 
echo
echo "Wait for NGINX ingress pods to complete"
sleep 15 
kubectl get pods -n ingress-nginx   -l app.kubernetes.io/name=ingress-nginx 
echo
echo "Wait for NGINX ingress pods to complete"
sleep 11 
echo "Check NGINX ingress version"
POD_NAMESPACE=ingress-nginx
POD_NAME=$(kubectl get pods -n $POD_NAMESPACE -l app.kubernetes.io/name=ingress-nginx --field-selector=status.phase=Running -o jsonpath='{.items[0].metadata.name}')
kubectl exec -it $POD_NAME -n $POD_NAMESPACE -- /nginx-ingress-controller --version

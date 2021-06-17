#!/bin/bash

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended.yaml
kubectl apply -f dashboard-user.yaml
kubectl apply -f admin-clusterrolebinding.yaml
sleep 15
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}') | grep token\:
sleep 15
kubectl -n kubernetes-dashboard get pods

echo "Run kubectl proxy"
echo 
echo "Dashboard available at: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/"


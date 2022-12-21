#!/bin/bash

helm install awesome ./helm/awesome-app \
  -n awesome \
  --create-namespace 

export POD_NAME=$(kubectl get pods --namespace awesome -l "app.kubernetes.io/name=awesome-app,app.kubernetes.io/instance=awesome" -o jsonpath="{.items[0].metadata.name}")
export CONTAINER_PORT=$(kubectl get pod --namespace awesome $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
echo "Visit http://127.0.0.1:8080 to use your application"
kubectl --namespace awesome port-forward $POD_NAME 8080:$CONTAINER_PORT


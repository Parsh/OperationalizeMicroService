#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath="parsh24/ml-microservice"


# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment ml-microservice-kube --image=$dockerpath


# Step 3:
# List kubernetes pods
kubectl get pods --all-namespaces

# Step 4:
# Forward the container port to a host
kubectl expose deployment ml-microservice-kube --type="NodePort" --port=80
kubectl port-forward deployment/ml-microservice-kube 8000:80
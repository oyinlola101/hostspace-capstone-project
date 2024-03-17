#!/bin/bash

# Define the namespaces to create
namespaces=(
  "cert-manager"
  "nginx-ingress"
  "app"
  "monitoring"
)

# Loop through the namespaces array
for namespace in "${namespaces[@]}"
do
  # Check if the namespace already exists
  if kubectl get namespace "$namespace" > /dev/null 2>&1; then
    echo "Namespace '$namespace' already exists."
  else
    # Create the namespace
    echo "Creating namespace '$namespace'..."
    kubectl create namespace "$namespace"
  fi
done
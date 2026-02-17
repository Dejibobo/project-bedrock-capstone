#!/bin/bash

# Step 0: Ensure we are in the project root
cd ~/project-bedrock-capstone || exit

# Step 1: Create the namespace
kubectl apply -f k8s/retail-app-namespace.yaml

# Step 2: Clone the retail-store-sample-app Helm chart if not already present
if [ ! -d helm/retail-store-sample-app ]; then
    cd helm
    git clone https://github.com/aws-containers/retail-store-sample-app.git retail-store-sample-app
    cd ..
fi

# Step 3: Deploy the app using Helm and your custom values.yaml
helm upgrade --install retail-app ./helm/retail-store-sample-app \
  --namespace retail-app \
  -f k8s/retail-app-values.yaml

# Step 4: Wait for all pods to be ready
echo "Waiting for pods to be ready..."
kubectl wait --namespace retail-app --for=condition=Ready pods --all --timeout=600s

# Step 5: Verify
echo "Deployment complete! Here are the pods:"
kubectl get pods -n retail-app

echo "Here are the services:"
kubectl get svc -n retail-app


#!/bin/bash

echo "🚀 Deploying Redis..."
kubectl apply -f manifests/redis/

echo "🚀 Deploying Worker..."
kubectl apply -f manifests/worker/

echo "🚀 Deploying KEDA Scaler..."
kubectl apply -f manifests/keda/

echo "🚀 Running Job Producer..."
kubectl apply -f manifests/jobs/

echo "✅ Deployment Complete!"
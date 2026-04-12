#!/bin/bash

echo "🧹 Cleaning up resources..."

kubectl delete -f manifests/jobs/ --ignore-not-found
kubectl delete -f manifests/keda/ --ignore-not-found
kubectl delete -f manifests/worker/ --ignore-not-found
kubectl delete -f manifests/redis/ --ignore-not-found

echo "✅ Cleanup done!"
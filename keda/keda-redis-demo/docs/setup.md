# KEDA Redis Autoscaling Demo

## 📌 Overview
This project demonstrates event-driven autoscaling using:
- Kubernetes
- KEDA
- Redis Queue

## 🏗 Architecture
Producer → Redis Queue → Worker → KEDA Scales Workers

## ⚙️ Prerequisites
- Kubernetes cluster (Minikube)
- kubectl
- Helm
- KEDA installed
- Metrics Server

## 🚀 Deployment

```bash
./scripts/deploy.sh
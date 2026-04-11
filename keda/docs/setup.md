# ⚙️ Setup Guide

## 📌 Prerequisites

- Kubernetes cluster
- ArgoCD installed
- Helm installed
- Metrics Server enabled

---

## 🚀 Steps

### 1. Deploy KEDA via ArgoCD
Apply KEDA Helm application.

---

### 2. Deploy Kafka
Install Kafka using Helm chart.

---

### 3. Deploy Application
Deploy consumer application.

---

### 4. Apply ScaledObject
Configure scaling based on Kafka.

---

## ✅ Verification

```bash
kubectl get pods -A
kubectl get scaledobject
kubectl get hpa

## 🧰 Additional Tools

These tools improve productivity while working with Kubernetes and event-driven systems:

### 🔹 k9s
CLI-based Kubernetes UI for managing clusters.

```bash
brew install k9s

🔹 kcat

Kafka CLI tool for producing and consuming messages.

brew install kcat

🔹 kubectx

Quickly switch between Kubernetes contexts and namespaces.

brew install kubectx
🔹 stern

Tail logs from multiple Kubernetes pods in real time.

brew install stern

These tools are optional but highly recommended for debugging and operational efficiency.


---

# 🚀 NOW: STEP 1 — KEDA via ArgoCD (GitOps Setup)

We will:
```text
Install KEDA using Helm via ArgoCD
# 🚀 KEDA Event-Driven Autoscaling Project

## 📌 Overview

This project demonstrates event-driven autoscaling in Kubernetes using KEDA, Kafka, and ArgoCD (GitOps).

---

## 🧩 Components

- ArgoCD (GitOps)
- KEDA (Autoscaling)
- Kafka (Event source)
- Kubernetes (Workloads)

---

## 🔥 Features

- Scale pods based on Kafka events
- Scale to zero when idle
- Fully GitOps managed
- Production-style setup

---

## 📂 Structure

- base → KEDA installation
- kafka → Kafka setup
- app → Demo application
- scaledobject → Scaling configuration
- docs → Documentation

---

## 🎯 Use Case

Autoscale worker pods based on message queue length in Kafka.
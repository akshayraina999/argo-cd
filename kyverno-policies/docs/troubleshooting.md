# 🛠️ Troubleshooting Guide

## 📌 Common Issues & Fixes

---

## ❌ 1. ArgoCD App Status = Unknown

### Cause
- Incorrect repo path
- Missing manifests

### Fix

```bash
kubectl describe application <app-name> -n argocd

Check:

repoURL
path
❌ 2. ClusterPolicy Not Found
Error
could not find kyverno.io/ClusterPolicy
Cause
Kyverno CRDs not installed
Fix
kubectl get crd | grep kyverno

If not present:

helm install kyverno kyverno/kyverno -n kyverno
❌ 3. Policies Not Enforced
Cause
Kyverno not running
Wrong namespace
Fix
kubectl get pods -n kyverno
❌ 4. ArgoCD Sync Failed
Fix
kubectl logs -n argocd deploy/argocd-application-controller
❌ 5. Kyverno Logs Not Found
Fix
kubectl get deploy -n kyverno
kubectl logs -n kyverno deploy/kyverno-admission-controller
❌ 6. Policy Not Triggering
Check
Resource matches policy
Correct kind (Pod/Deployment)
Labels/selectors
🔍 Debug Commands
kubectl get applications -n argocd
kubectl get cpol
kubectl get pods -A
kubectl logs -n kyverno deploy/kyverno-admission-controller
🎯 Tips
Always install CRDs before applying policies
Verify repo paths in ArgoCD
Use kubectl describe for debugging

---

# 📜 3. `policies-explained.md`

```markdown
# 📜 Kyverno Policies Explained

## 📌 Overview

This document explains each Kyverno policy used in this project.

---

## 🔐 1. require-labels

### Purpose
Ensures all resources have mandatory labels.

### Why
- Better organization
- Easier filtering and monitoring

---

## 🚫 2. restrict-image-registry

### Purpose
Allows images only from approved registries.

### Why
- Prevents use of untrusted images
- Improves supply chain security

---

## ⚠️ 3. disallow-latest-tag

### Purpose
Blocks usage of `latest` image tag.

### Why
- Ensures version consistency
- Avoids unexpected deployments

---

## 📏 4. require-resource-limits

### Purpose
Enforces CPU and memory limits.

### Why
- Prevents resource exhaustion
- Improves cluster stability

---

## 🔒 5. disallow-privileged

### Purpose
Blocks privileged containers.

### Why
- Reduces security risks
- Prevents host-level access

---

## 🩺 6. require-probes

### Purpose
Ensures liveness and readiness probes are defined.

### Why
- Improves reliability
- Enables self-healing

---

## 👤 7. enforce-non-root

### Purpose
Ensures containers run as non-root.

### Why
- Follows least privilege principle
- Reduces attack surface

---

## 🌐 8. generate-network-policy

### Purpose
Automatically creates default network policies.

### Why
- Enforces zero-trust networking
- Prevents unrestricted traffic

---

## 🎯 Summary

These policies ensure:

- Security best practices
- Standardized deployments
- Stable and reliable workloads
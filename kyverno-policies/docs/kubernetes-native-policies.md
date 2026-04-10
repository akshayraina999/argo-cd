# Kubernetes Native Policies & Security Controls (Reference Guide)

## 📌 Overview

This document provides a collection of Kubernetes-native mechanisms used to enforce security, governance, and resource control, along with practical YAML examples.

---

# 🔐 1. Pod Security Admission (PSA)

## 📖 Description

Enforces security standards at namespace level using predefined policies.

## 🔹 Modes

* privileged
* baseline
* restricted

## 📌 Example

```bash
kubectl create namespace secure-ns
kubectl label namespace secure-ns pod-security.kubernetes.io/enforce=restricted
```

---

# 👤 2. RBAC (Role-Based Access Control)

## 📖 Role Example

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: dev
  name: pod-reader
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "list"]
```

---

## 📖 RoleBinding Example

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: read-pods
  namespace: dev
subjects:
- kind: User
  name: dev-user
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io
```

---

# 🌐 3. Network Policy

## 📖 Default Deny All Traffic

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: default-deny
  namespace: dev
spec:
  podSelector: {}
  policyTypes:
  - Ingress
  - Egress
```

---

## 📖 Allow Specific Traffic

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-backend
  namespace: dev
spec:
  podSelector:
    matchLabels:
      role: frontend
  ingress:
  - from:
    - podSelector:
        matchLabels:
          role: backend
```

---

# 🔒 4. Security Context

## 📖 Pod-Level Security

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: secure-pod
spec:
  securityContext:
    runAsNonRoot: true
  containers:
  - name: nginx
    image: nginx
```

---

## 📖 Container-Level Security

```yaml
securityContext:
  allowPrivilegeEscalation: false
  readOnlyRootFilesystem: true
```

---

# 🧱 5. ResourceQuota

## 📖 Example

```yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: resource-quota
  namespace: dev
spec:
  hard:
    pods: "10"
    requests.cpu: "2"
    requests.memory: 4Gi
    limits.cpu: "4"
    limits.memory: 8Gi
```

---

# 📏 6. LimitRange

## 📖 Example

```yaml
apiVersion: v1
kind: LimitRange
metadata:
  name: limit-range
  namespace: dev
spec:
  limits:
  - default:
      cpu: "500m"
      memory: "256Mi"
    defaultRequest:
      cpu: "250m"
      memory: "128Mi"
    type: Container
```

---

# 🔑 7. Service Account

## 📖 Example

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: app-sa
  namespace: dev
```

---

## 📖 Attach to Pod

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: sa-pod
spec:
  serviceAccountName: app-sa
  containers:
  - name: nginx
    image: nginx
```

---

# 🔐 8. Pod Disruption Budget (PDB)

## 📖 Example

```yaml
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: pdb-example
spec:
  minAvailable: 2
  selector:
    matchLabels:
      app: nginx
```

---

# ⚙️ 9. Horizontal Pod Autoscaler (HPA)

## 📖 Example

```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: hpa-example
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: nginx
  minReplicas: 2
  maxReplicas: 5
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 50
```

---

# 🌍 10. Ingress (Traffic Control)

## 📖 Example

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-example
spec:
  rules:
  - host: myapp.local
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: nginx
            port:
              number: 80
```

---

# 🧠 Summary

These native Kubernetes controls help enforce:

* Security (PSA, SecurityContext)
* Access Control (RBAC, ServiceAccounts)
* Networking (NetworkPolicies, Ingress)
* Resource Management (Quota, Limits, HPA)
* Availability (PDB)

---

# 🎯 Usage

Use this document as:

* Quick reference
* Interview revision
* Real-world implementation guide

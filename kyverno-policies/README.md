# Kyverno Policy Implementation

## Overview
This repository contains Kyverno policies to enforce security, governance, and best practices in Kubernetes clusters.

## Policies
- Require Labels
- Restrict Image Registry
- Disallow Latest Tag
- Require Resource Limits
- Disallow Privileged Containers
- Enforce Non-Root Execution
- Require Health Probes
- Generate Default Network Policy

## Installation
```bash
helm repo add kyverno https://kyverno.github.io/kyverno/
helm install kyverno kyverno/kyverno -n kyverno --create-namespace
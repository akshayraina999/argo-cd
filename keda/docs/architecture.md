
---

# 🏗️ 3. `architecture.md`

```markdown
# 🏗️ Architecture

## 📌 Flow

---

## 🔄 Workflow

1. Messages pushed to Kafka
2. KEDA monitors lag
3. KEDA creates HPA
4. Pods scale automatically

---

## 🧠 Components

- Kafka → Event source
- KEDA → Scaling engine
- HPA → Native scaling
- Deployment → Worker pods

---

## 🎯 Key Benefit

Event-driven autoscaling instead of resource-based scaling.
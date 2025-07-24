
---

## ✅ Project Backlog (Work Items)

### 🔧 Infrastructure & AWS Setup
- [ ] Create an ECR repository
- [ ] Create an ECS Cluster with Fargate launch type
- [ ] Define ECS Task Definition with CPU/memory/container settings
- [ ] Set up ECS Service linked to the task definition
- [ ] Configure IAM roles for GitHub Actions to access ECS and ECR

### 💻 Local App Setup
- [ ] Containerize the application with Docker
- [ ] Create `.dockerignore`
- [ ] Add a `Dockerfile` with multistage build (if needed)
- [ ] Create a sample `ecs/task-definition.json`

### 🧪 CI/CD Pipeline Setup
- [ ] Write GitHub Actions workflow `.github/workflows/deploy.yml`
  - [ ] Step 1: Checkout code
  - [ ] Step 2: Lint Dockerfile with Hadolint
  - [ ] Step 3: Scan image with Trivy
  - [ ] Step 4: Log in to AWS ECR
  - [ ] Step 5: Build & push Docker image
  - [ ] Step 6: Register new ECS task definition
  - [ ] Step 7: Deploy new task in ECS service
- [ ] Add GitHub secrets to your repo

### 🛡️ Optional (Security & Monitoring)
- [ ] Add Slack/email notification on failure
- [ ] Add Prometheus/Grafana monitoring for deployed service
- [ ] Set up CloudWatch alarms

### 🚀 Final Steps
- [ ] Test deployment with a sample commit
- [ ] Validate rollback in case of failure
- [ ] Document usage instructions in `README.md`

---

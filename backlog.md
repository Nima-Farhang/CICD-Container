
## ✅ Project Backlog (with Terraform)

### 🔧 Infrastructure Setup (with Terraform)
- [ ] Write Terraform `main.tf`, `variables.tf`, `outputs.tf`
- [ ] Provision ECR repository via Terraform
- [ ] Provision ECS Cluster via Terraform
- [ ] Create ECS Task Definition via Terraform
- [ ] Create ECS Fargate Service via Terraform
- [ ] Create IAM Role for ECS task execution via Terraform
- [ ] Output necessary variables (ECR URL, ECS cluster/service names)

### 💻 Application Containerization
- [ ] Containerize the app with Docker
- [ ] Create a proper `.dockerignore` file
- [ ] Write a production-grade `Dockerfile`
- [ ] Test the container locally

### 🧪 CI/CD Pipeline (GitHub Actions)
- [ ] Create `.github/workflows/deploy.yml` pipeline
  - [ ] Step 1: Checkout repo
  - [ ] Step 2: Lint Dockerfile using Hadolint
  - [ ] Step 3: Scan image using Trivy
  - [ ] Step 4: Build & push image to ECR
  - [ ] Step 5: Register new ECS Task Definition
  - [ ] Step 6: Update ECS Service with new task

### 🔐 GitHub Secrets & Environment
- [ ] Add AWS credentials to GitHub Secrets
- [ ] Add environment variables (ECS, ECR names)
- [ ] Reference Terraform outputs for automation

### 📈 Monitoring & Future Enhancements
- [ ] Add logging & metrics integration (e.g. CloudWatch, Prometheus)
- [ ] Add rollback capability in CI/CD
- [ ] Add Slack/email alerts for failures
- [ ] Automate Terraform apply via GitHub Actions (optional)



# CI/CD Pipeline: Containerized App Deployment to AWS ECS (with Terraform)

This project sets up a CI/CD pipeline using GitHub Actions to build, scan, and deploy a containerized application to AWS ECS (Fargate). It uses **Terraform** to provision all required AWS infrastructure.

---

## 🧰 Tech Stack

- GitHub Actions (CI/CD)
- Docker & Docker Compose
- AWS ECS (Fargate) via Terraform
- AWS ECR (image repository)
- AWS IAM (for roles and policies)
- AWS CloudWatch (logging)
- Trivy (security scanning)
- Hadolint (Dockerfile linting)

---

## 📦 Repository Structure

```text
.
├── .github/workflows/
│   └── deploy.yml
├── app/
│   └── Dockerfile, app.py, requirements.txt
├── ecs/
│   └── task-definition.json (used during CI/CD only)
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── .dockerignore
├── .hadolint.yaml
├── README.md
```

---

## 🚀 CI/CD Workflow Overview

1. Lint Dockerfile using `hadolint`
2. Scan Docker image with `trivy`
3. Build and push Docker image to ECR
4. Register new ECS task definition
5. Deploy updated task in ECS service

---

## ☁️ Terraform Infrastructure

Terraform provisions the following AWS resources:

- ECR repository
- ECS Cluster (Fargate)
- ECS Task Definition
- ECS Service
- IAM Role for ECS Task Execution

To deploy infrastructure:

```bash
cd terraform
terraform init
terraform apply -var-file="my-variables.tfvars"
```

---

## 🛠️ GitHub Secrets Required

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`
- `ECR_REPOSITORY`
- `ECS_CLUSTER_NAME`
- `ECS_SERVICE_NAME`
- `ECS_TASK_DEFINITION_FAMILY`

---

## 📈 Future Improvements

- Add rollback on ECS deployment failure
- Integrate CloudWatch monitoring
- Add Prometheus/Grafana metrics collection
- Add alerting and notifications

MIT License


# CI/CD Pipeline: Containerized App Deployment to AWS ECS

This project sets up a CI/CD pipeline using GitHub Actions to build, scan, and deploy a containerized application to AWS ECS (Fargate).

## 🧰 Tech Stack

- GitHub Actions (CI/CD)
- Docker & Docker Compose
- AWS ECS (Fargate)
- AWS ECR (image repository)
- AWS CloudWatch (logging)
- Trivy (security scanning)
- Hadolint (Dockerfile linting)

## Setup

1. Create AWS ECS cluster, task definition, and ECR repo.
2. Add GitHub secrets: AWS credentials, region, ECS and ECR names.
3. Push to `main` to trigger CI/CD.

MIT License

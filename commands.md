# login to AWS

```bash
aws sso login --profile Nima
```

// terraform folder

# Terraform

```bash
terraform init
terraform fmt
terraform validate
terraform apply
terraform show
terraform state list
terraform destroy

terraform apply -var-file="prod.tfvars" -var="instance_type=m5.large"
```

// Docker build and push to ecr

# go to terraform folder run this

```bash
export ECR_REPO_URL=$(terraform output -raw ecr_repository_url)

aws ecr get-login-password --region ap-southeast-2 --profile Nima \
| docker login --username AWS --password-stdin $(echo $ECR_REPO_URL | cut -d'/' -f1)

docker build -t my-app .
docker tag my-app:latest $ECR_REPO_URL:latest
docker push $ECR_REPO_URL:latest
```
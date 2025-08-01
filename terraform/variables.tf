
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-southeast-2"
}

variable "aws_key_id" {
  description = "AWS access key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
}

variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  type        = string
  default     = "farhang-ecr-repo"
}
variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  default     = "farhang-ecs-cluster"
}
variable "ecs_task_family" {
  description = "Family name for the ECS task definition"
  type        = string
  default     = "farhang-task-family"
}
variable "ecs_service_name" {
  description = "Name of the ECS service"
  type        = string
  default     = "farhang-ecs-service"
}
variable "subnet_ids" {
  description = "List of subnet IDs for the ECS tasks"
  type        = list(string)
  default     = ["subnet-0123456789abcdef0", "subnet-0fedcba9876543210"]
}
variable "security_group_id" {
  description = "Security group ID for the ECS tasks"
  type        = string
  default     = "sg-0123456789abcdef0"
}


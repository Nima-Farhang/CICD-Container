
variable "aws_region" {}
variable "ecr_repository_name" {}
variable "ecs_cluster_name" {}
variable "ecs_task_family" {}
variable "ecs_service_name" {}
variable "subnet_ids" {
  type = list(string)
}
variable "security_group_id" {}

variable "account_id" {
  description = "ID of the account"
  type        = string
  default     = "767397659305"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap_southeast_2"
}

variable "environment" {
  description = "the environment"
  type        = string
  default     = "dev"
}

variable "task_cpu" {

  type    = string
  default = "256"
}

variable "task_memory" {

  type    = string
  default = "512"
} # match valid Fargate memory for chosen CPU

variable "image_uri" { type = string } # e.g., "<account>.dkr.ecr.<region>.amazonaws.com/my-app:latest"

variable "container_port" {
  type    = number
  default = 80
}



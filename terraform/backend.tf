# This configuration sets up a local backend for Terraform state management.
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}


# Late on you can use this configuration to set up an S3 backend for Terraform state management.
# terraform {
#   backend "s3" {
#     bucket = "terraform-state-bucket"
#     key    = "${var.environment}/terraform.tfstate"
#     region = "ap-southeast-2"
#     dynamodb_table = "terraform-locks"
#     encrypt = true
#   }
# }
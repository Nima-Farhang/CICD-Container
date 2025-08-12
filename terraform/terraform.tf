terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }

  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region                   = "ap-southeast-2"
  shared_config_files      = ["/home/vscode/.aws/config"]
  shared_credentials_files = ["/home/vscode/.aws/credentials"]
  profile                  = "Nima"
}
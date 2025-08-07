#!/bin/bash
set -e

# Set AWS CLI SSO configuration for profile "Nima"
aws configure set sso_start_url "https://d-9067e9a26d.awsapps.com/start" --profile Nima
aws configure set sso_region "us-east-1" --profile Nima
aws configure set sso_account_id "767397659305" --profile Nima
aws configure set sso_role_name "AdministratorAccess" --profile Nima
aws configure set region "ap-southeast-2" --profile Nima
aws configure set output "json" --profile Nima
aws configure set sso_session "Terraform" --profile Nima
aws configure set sso_registration_scopes "sso:account:access" --profile Nima

# Create SSO session config
aws configure set sso_session.Terraform.sso_start_url "https://d-9067e9a26d.awsapps.com/start"
aws configure set sso_session.Terraform.sso_region "us-east-1"
aws configure set sso_session.Terraform.sso_registration_scopes "sso:account:access"

# Optionally, login (will require browser interaction)
# aws sso login --profile Nima

echo "AWS CLI SSO profile 'Nima' configured."

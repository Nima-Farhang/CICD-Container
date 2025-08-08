#!/bin/bash
set -e

AWS_CONFIG_FILE="${HOME}/.aws/config"
mkdir -p "$(dirname "$AWS_CONFIG_FILE")"

cat > "$AWS_CONFIG_FILE" <<EOF
[profile Nima]
sso_session = Terraform
sso_account_id = 767397659305
sso_role_name = AdministratorAccess
region = ap-southeast-2
output = json

[sso-session Terraform]
sso_start_url = https://d-9067e9a26d.awsapps.com/start
sso_region = us-east-1
sso_registration_scopes = sso:account:access
EOF

echo "AWS CLI SSO profile 'Nima' and session 'Terraform' configured."
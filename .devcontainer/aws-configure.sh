#!/bin/bash
set -e

ENV_FILE="../.env"

get_env_var() {
  grep "^$1=" "$ENV_FILE" | cut -d '=' -f2- | tr -d '"\r\n '
}

AWS_ACCESS_KEY_ID=$(get_env_var AWS_ACCESS_KEY_ID)
export AWS_ACCESS_KEY_ID
echo "AWS_ACCESS_KEY_ID exported: $AWS_ACCESS_KEY_ID"

AWS_SECRET_ACCESS_KEY=$(get_env_var AWS_SECRET_ACCESS_KEY)
export AWS_SECRET_ACCESS_KEY
echo "AWS_SECRET_ACCESS_KEY exported: $AWS_SECRET_ACCESS_KEY"

AWS_SESSION_TOKEN=$(get_env_var AWS_SESSION_TOKEN)
export AWS_SESSION_TOKEN
echo "AWS_SESSION_TOKEN exported: $AWS_SESSION_TOKEN"

SSO_START_URL=$(get_env_var SSO_START_URL)
export SSO_START_URL
echo "SSO_START_URL exported: $SSO_START_URL"

SSO_ACCOUNT_ID=$(get_env_var SSO_ACCOUNT_ID)
export SSO_ACCOUNT_ID
echo "SSO_ACCOUNT_ID exported: $SSO_ACCOUNT_ID"

PROFILE_NAME=$(get_env_var PROFILE_NAME)
export PROFILE_NAME
echo "PROFILE_NAME exported: $PROFILE_NAME"

echo "DEBUG: SSO_ACCOUNT_ID='$SSO_ACCOUNT_ID'"

AWS_CREDENTIALS_FILE="${HOME}/.aws/credentials"
mkdir -p "$(dirname "$AWS_CREDENTIALS_FILE")"

cat > "$AWS_CREDENTIALS_FILE" <<EOF
[${SSO_ACCOUNT_ID}_AdministratorAccess]
aws_access_key_id=${AWS_ACCESS_KEY_ID}
aws_secret_access_key=${AWS_SECRET_ACCESS_KEY}
aws_session_token=${AWS_SESSION_TOKEN}
EOF

echo "AWS CLI credentials for account '${SSO_ACCOUNT_ID}' configured at ${AWS_CREDENTIALS_FILE}."

AWS_CONFIG_FILE="${HOME}/.aws/config"
mkdir -p "$(dirname "$AWS_CONFIG_FILE")"

cat > "$AWS_CONFIG_FILE" <<EOF
[profile ${PROFILE_NAME}]
sso_session = Terraform
sso_account_id = ${SSO_ACCOUNT_ID}
sso_role_name = AdministratorAccess
region = ap-southeast-2
output = json

[sso-session Terraform]
sso_start_url = ${SSO_START_URL}
sso_region = us-east-1
sso_registration_scopes = sso:account:access
EOF

echo "AWS CLI SSO profile '${PROFILE_NAME}' and session 'Terraform' configured at ${AWS_CONFIG_FILE}."
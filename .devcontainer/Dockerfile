# Dev container Dockerfile for Codespaces
FROM mcr.microsoft.com/devcontainers/python:0-3.10

# Install AWS CLI v2
RUN apt-get update \
    && apt-get install -y curl unzip \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" \
    && unzip /tmp/awscliv2.zip -d /tmp \
    && /tmp/aws/install \
    && rm -rf /tmp/aws /tmp/awscliv2.zip

# Install npm
RUN apt-get update && apt-get install -y npm

# Install Docker
RUN apt-get update \
    && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        gnupg \
        lsb-release \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list \
    && apt-get update \
    && apt-get install -y docker-ce docker-ce-cli containerd.io

# Install Terraform
RUN apt-get update \
    && apt-get install -y gnupg software-properties-common \
    && wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor > /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/hashicorp.list \
    && apt-get update \
    && apt-get install -y terraform

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy AWS CLI SSO configuration script
COPY .devcontainer/aws-configure.sh /usr/local/bin/aws-configure.sh
RUN chmod +x /usr/local/bin/aws-configure.sh

# Run AWS CLI SSO configuration script
RUN /usr/local/bin/aws-configure.sh

# Add alias for root directory
RUN echo "alias root='cd /workspaces/CICD-Container'" >> /etc/bash.bashrc

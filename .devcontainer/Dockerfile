# Dev container Dockerfile for Codespaces
FROM mcr.microsoft.com/devcontainers/python:0-3.10

# Install AWS CLI v2
RUN apt-get update \
    && apt-get install -y curl unzip \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" \
    && unzip /tmp/awscliv2.zip -d /tmp \
    && /tmp/aws/install \
    && rm -rf /tmp/aws /tmp/awscliv2.zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install npm
RUN apt-get update && apt-get install -y npm && rm -rf /var/lib/apt/lists/*

# Copy AWS CLI SSO configuration script
COPY .devcontainer/aws-configure.sh /usr/local/bin/aws-configure.sh
RUN chmod +x /usr/local/bin/aws-configure.sh

# Run AWS CLI SSO configuration script
RUN /usr/local/bin/aws-configure.sh

# Add alias for root directory
RUN echo "alias root='cd /workspaces/CICD-Container'" >> /etc/bash.bashrc

# Dev container Dockerfile for Codespaces
FROM mcr.microsoft.com/devcontainers/python:0-3.10

# Install dependencies: AWS CLI v2, npm, Docker, Terraform
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl unzip gnupg lsb-release apt-transport-https ca-certificates software-properties-common npm \
    && \
    # Install AWS CLI v2
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" \
    && unzip /tmp/awscliv2.zip -d /tmp \
    && /tmp/aws/install \
    && rm -rf /tmp/aws /tmp/awscliv2.zip \
    && \
    # Install Docker CLI
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list \
    && apt-get update && apt-get install -y --no-install-recommends docker-ce docker-ce-cli containerd.io \
    && \
    # Install Terraform
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor > /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/hashicorp.list \
    && apt-get update && apt-get install -y --no-install-recommends terraform \
    && \
    # Clean up
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy AWS CLI SSO configuration script (to be run at container start, not build)
COPY .devcontainer/aws-configure.sh /usr/local/bin/aws-configure.sh
RUN chmod +x /usr/local/bin/aws-configure.sh
RUN ./usr/local/bin/aws-configure.sh

# Add alias for root directory
RUN echo "alias root='cd /workspaces/CICD-Container'" >> /etc/bash.bashrc

# Set the default shell to bash
CMD ["bash"]

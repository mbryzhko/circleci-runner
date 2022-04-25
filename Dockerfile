FROM circleci/runner:1.0.35012-2fb4f32
# launch-agent
MAINTAINER vgs

# Install Terraform
RUN sudo apt-get update && \
    sudo apt-get install --no-install-recommends -y gnupg software-properties-common curl
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
RUN sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN sudo apt-get update && sudo apt-get install terraform=0.12.31

# Install Terragrunt
RUN curl -fsSL https://github.com/gruntwork-io/terragrunt/releases/download/v0.36.0/terragrunt_linux_arm64 -o /tmp/terragrunt && \
    chmod u+x /tmp/terragrunt && \
    sudo mv /tmp/terragrunt /usr/local/bin/terragrunt

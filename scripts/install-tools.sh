#!/bin/bash

set -e

echo "Installing dependencies..."

sudo apt update

sudo apt install -y jq unzip curl git gettext-base

# Install Railway CLI
bash <(curl -fsSL cli.new)

# Install Terraform
wget https://releases.hashicorp.com/terraform/1.8.5/terraform_1.8.5_linux_amd64.zip

unzip -o terraform_1.8.5_linux_amd64.zip -d terraform-bin

sudo mv terraform-bin/terraform /usr/local/bin/

# Install Node.js
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -

sudo apt install -y nodejs

echo "Installed successfully"
#!/usr/bin/env bash

set -euo pipefail

mkdir -p "$LOCAL_EXECS_DIR"
# add LOCAL_EXECS_DIR to call the tools during build to fail early if something goes wrong
export PATH="$LOCAL_EXECS_DIR:$PATH"

# terraform
curl https://releases.hashicorp.com/terraform/1.3.6/terraform_1.3.6_linux_amd64.zip -o terraform.zip
unzip terraform.zip
chmod +x terraform && mv terraform "${LOCAL_EXECS_DIR}/terraform"
rm terraform.zip
terraform --version

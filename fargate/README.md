# Fargate Project

This folder contains Terraform configuration and helper scripts for deploying an AWS Fargate-based application. The configuration is designed to provision and initialize your infrastructure with the correct AWS provider settings.

## Overview

- **Terraform Providers:**  
  The configuration specifies the AWS provider with a version constraint (`~> 6.0`) and sets the region to `us-east-1`. It also includes default tags for resources and uses an assume role, which aids in managing permissions.

- **Makefile Helpers:**  
  A Makefile is provided to simplify common tasks. For example, the `clean-init` target removes previous Terraform artifacts and runs a fresh `terraform init`. This ensures that your Terraform environment is correctly set up.

## Prerequisites

- [Terraform](https://www.terraform.io/) installed (use tfenv for version management if needed)
- AWS CLI configured with appropriate permissions
- IAM role `arn:aws:iam::138021360462:role/terraform-fargate-example` available and allowed for the provided operations

## Usage

1. **Initialize Terraform:**  
   Use the Makefile to clean previous state and initialize the environment.
   ```sh
   make clean-init
   ```

2. **Plan and Apply Changes:**  
   Run Terraform commands to preview and deploy your infrastructure.
   ```sh
   make plan
   make apply
   ```

3. **Manage AWS Resources:**  
   The configurations defined in this folder will set up the necessary AWS resources for running your Fargate tasks.

4. **Watch the application running:**
    1. Go to the AWS Console
    1. Search for ECS service
    1. Select the creted cluster
    1. Select the service
    1. Go the _Configuration and networking_ tab
    1. In the _Network configuration_ section, search for _DNS names_ and click on _open address_ to visualize the nginx server running.

## Customization

- **Provider Configuration:**  
  Review and update the provider settings in `providers.tf` if needed (e.g., region, assume role details, and default tags).

- **Infrastructure Changes:**  
  Modify the Terraform files to customize your infrastructure setup according to your project requirements.

This README provides an overview of the Fargate project setup. For more detailed instructions on running and managing the infrastructure, refer to the comments
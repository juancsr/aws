# ECS Fargate Terraform Module

This folder contains Terraform configuration files to provision an AWS ECS (Elastic Container Service) cluster using Fargate launch type. It is designed to deploy containerized applications in a serverless manner, without managing EC2 instances.

## Structure

- **ecs.tf**: Main Terraform file. Defines the ECS cluster, Fargate-compatible task definition, service, networking (VPC, subnet), and security group resources.
- **Makefile**: Provides helper commands for Terraform operations (init, plan, apply, etc.).
- **.gitignore**: Ensures sensitive and local Terraform files are not committed to version control.

## What It Does

- **Creates an ECS Cluster**: The cluster is the logical grouping for your ECS resources.
- **Defines a Fargate Task Definition**: Specifies the container image, CPU, memory, and compatibility for Fargate.
- **Sets Up Networking**: Uses the default VPC and subnet, and configures security groups to allow inbound traffic on port 80.
- **Deploys a Service**: Runs and manages one or more copies of your container using the Fargate launch type.

## Usage

1. **Configure AWS Credentials**  
   Ensure your AWS credentials are set up locally (via environment variables or AWS CLI).

2. **Initialize Terraform**  
   ```sh
   make init
   ```

3. **Review the Execution Plan**  
   ```sh
   make plan
   ```

4. **Apply the Configuration**  
   ```sh
   make apply
   ```

5. **Destroy Resources**  
   ```sh
   terraform destroy
   ```

## Customization

- Update the container image and resource settings in `aws_ecs_task_definition`.
- Modify networking and security group rules as needed for your application.
- Adjust the desired count in the ECS service to scale your application.

## Notes

- The configuration uses the default VPC and subnet for simplicity. For production, consider using custom networking.
- The `.terraform.lock.hcl` file should be committed for provider version consistency.
- The Makefile can be extended or modified to suit your workflow.

## Requirements

- Terraform v1.0 or newer
- AWS CLI (optional, for credential management)
- AWS account with permissions to create ECS, networking, and IAM resources

##
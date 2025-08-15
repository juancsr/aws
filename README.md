# AWS Projects

This repository contains a collection of AWS-related projects including infrastructure exercises, notes, and examples. It leverages Terraform, ECS with Fargate, and various AWS services to demonstrate best practices for provisioning and managing cloud resources.

Use this repository as a reference for learning and experimenting with AWS services. Each subfolder contains its own README with detailed instructions for its specific domain.

## Highlights

- **Terraform Infrastructure:**  
  Provision and manage AWS resources like ECS clusters, task definitions, services, networking, and security groups. Terraform configuration files help enforce best practices and promote a reproducible infrastructure.

  tfenv makes it easy to install, manage, and switch between different versions of Terraform. This ensures that each project uses the correct version of Terraform for compatibility and stability. For more information and installation instructions, check out the [tfenv repository](https://github.com/tfutils/tfenv).

- **ECS Fargate Examples:**  
  See the `ecs` folder for sample configurations that deploy containerized applications using AWS Fargate. These examples show how to set up a cluster, define task definitions, configure networking, and run services.

- **Automated Workflows:**  
  The repository includes Makefiles for common operations (e.g., Terraform init, plan, apply) to simplify local development and deployment tasks.

- **Dependabot Integration:**  
  Automated dependency updates are configured via Dependabot to ensure that your Terraform providers and other package ecosystems stay up-to-date.

## Getting Started

1. **Clone the Repository**  
   ```sh
   git clone <repository-url>
   cd aws
   ```

2. **Review Specific Project READMEs**  
   Each subfolder (e.g., `ecs/`) contains its own README with detailed instructions and architecture explanations.

3. **Configure Your Environment**  
   Ensure AWS credentials are set (via environment variables or AWS CLI config) and that Terraform is installed.

4. **Run Terraform Commands**  
   Use the provided Makefiles for common operations:
   - Initialize Terraform:  
     ```sh
     make init
     ```
   - Review infrastructure changes:  
     ```sh
     make plan
     ```
   - Apply configuration:  
     ```sh
     make apply
     ```

## Contributing

Contributions and improvements are welcome. Please open issues or submit pull requests to help enhance the examples and documentation.

## License

This repository is licensed under the GNU general public license.
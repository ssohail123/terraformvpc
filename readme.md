# AWS Infrastructure Automation with Terraform

## Project Overview
This project demonstrates the automation of AWS infrastructure deployment using Terraform. It involved setting up an environment on an AWS EC2 instance to deploy essential resources, including a Virtual Private Cloud (VPC), public subnets, an EC2 instance, and security group configurations.

## Achievements
- **Automated Infrastructure Setup**: Successfully automated the deployment of AWS resources, reducing manual configuration efforts and improving consistency.
- **Dynamic Resource Management**: Implemented dynamic blocks for security groups, enabling flexible and scalable management of ingress and egress rules. This allows for easy adjustments in the future as project requirements evolve.
- **Version-Controlled Infrastructure**: Managed infrastructure configurations as code, allowing for better tracking of changes, collaboration, and reproducibility of the environment.

## Installation and Setup Process

1. **Launch an EC2 Instance**: Start by launching an EC2 instance in your AWS account, selecting an appropriate Amazon Machine Image (AMI) and instance type.

2. **Install Terraform and AWS CLI**: SSH into the EC2 instance and install Terraform and the AWS CLI to facilitate resource management and deployment.

3. **Configure AWS CLI**: Set up the AWS CLI by entering your AWS credentials and preferred settings.

4. **Create Terraform Configuration Files**: Develop the necessary Terraform configuration files (`main.tf` and `variables.tf`) to define the required AWS infrastructure components.

5. **Manage Infrastructure Lifecycle**: Use Terraform commands to initialize the environment, plan the infrastructure changes, and apply the configurations to deploy the resources.

## Resources Deployed
- **VPC**: Created a scalable Virtual Private Cloud to host the resources securely.
- **Public Subnets**: Established public subnets for hosting the EC2 instance, enabling internet access.
- **EC2 Instance**: Deployed an EC2 instance configured for application hosting.
- **Security Groups**: Configured security groups with dynamic rules to manage network traffic efficiently.

## Future Enhancements
- Expand the security group configurations to include additional ports as needed.
- Explore and implement further AWS resources to enhance the infrastructure based on project requirements.

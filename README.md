# Terraform EC2 Demo

Simple Terraform configuration demonstrating conditional expressions, provisioners, and basic AWS resource management.

## Features

- **Conditional expressions** - Different AMI/instance types based on environment
- **Provisioners** - Local-exec, remote-exec (commented), and file provisioners
- **Security group** - SSH access configuration
- **Data sources** - Latest Amazon Linux 2 AMI lookup

## Prerequisites

- Terraform installed
- AWS credentials configured
- SSH key pair created

## Usage

1. **Create a `terraform.tfvars` file:**

```hcl
key_pair_name      = "your-key-pair-name"
private_key_path   = "/path/to/your/private-key.pem"
environment        = "dev"  # or "prod"
```

2. **Initialize and apply:**

```bash
terraform init
terraform plan
terraform apply
```

3. **Outputs:**

- EC2 instance ID
- Public IP address

## Variables

| Variable           | Description                 | Default    |
| ------------------ | --------------------------- | ---------- |
| `environment`      | Environment type (dev/prod) | `prod`     |
| `instance_count`   | Number of instances         | `2`        |
| `instance_type`    | EC2 instance type           | `t2.micro` |
| `key_pair_name`    | SSH key pair name           | Required   |
| `private_key_path` | Path to private key         | Required   |

## Clean Up

```bash
terraform destroy
```

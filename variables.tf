# String type
variable "environment" {
  type        = string
  description = "The environment type"
  default     = "prod"
}
variable "localstack_endpoint" {
  type        = string
  description = "LocalStack endpoint URL"
  default     = "http://localhost:4566"
}
variable "aws_region" {
  type        = string
  description = "AWS region for resources"
  default     = "us-east-1"
}


variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 2
}
# variable for instance type
variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

# variable for key pair name
variable "key_pair_name" {
  description = "Name of the key pair for EC2 instance"
  type        = string
}
# variable for ssh user
variable "ssh_user" {
  description = "SSH user for EC2 instance"
  type        = string
  default     = "ubuntu"
}
# variable for private key path
variable "private_key_path" {
  description = "Path to the private key file for SSH"
  type        = string
  # default     = "~/.ssh/my-key-pair.pem"
}
# CONDITIONAL EXPRESSIONS
resource "aws_instance" "ec2_conditional" {
  count = var.instance_count
  ami=var.environment=="prod" ? "ami-07b643b5e45e" : "ami-024f768332f0"
  instance_type = var.environment == "prod" ? "t3.large" : "t2.micro"
  tags = {
    Name = "conditional-instance-${count.index + 1}"
  }
}
#  DYNAMIC BLOCKS
#   creates multiple security group rules from a list variable ie ingress_rules
resource "aws_security_group" "ssh" {
  name        = "tf-provisioner sg"
  description = "Security group for demonstrating provisioner"

 ingress {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  description = "Allow SSH access"
}


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Security group for provisioner demo"

  }
}
resource "aws_instance" "ec2_demo" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type 
  key_name = var.key_pair_name
  vpc_security_group_ids = [aws_security_group.ssh.id]

  tags = {
    Name = "ec2-demo-instance"
  }

  connection {
    type = "ssh"
    user=var.ssh_user
    private_key = file(var.private_key_path)
    host = self.public_ip

  }
  #local exec provisioner
  provisioner "local-exec" {
    command = "echo 'local-exec provisioner executed from instance ${self.id} with public IP ${self.public_ip}'"
  }
  #remote exec provisioner
#   provisioner "remote-exec" {
#     inline = [
#       "echo 'remote-exec provisioner executed on instance ${self.id} with public IP ${self.public_ip} in aws'"
#     ]
# }
# file provisioner
  # provisioner "file" {
  #   source      = "${path.module}/scripts/setup.sh"
  #   destination = "/tmp/${var.ssh_user}/setup.sh"
  # }
}
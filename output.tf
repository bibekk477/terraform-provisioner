# instance ID
output "ec2_demo_instance_id" {
  description = "The ID of the EC2 demo instance"
  value       = aws_instance.ec2_demo.id
}
# instance public IP
output "ec2_demo_instance_public_ip" {
  description = "The public IP of the EC2 demo instance"
  value       = aws_instance.ec2_demo.public_ip
}
# outputs print values after terraform apply
# so you don't have to dig through terraform show

output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.app.id
}

output "instance_type" {
  description = "EC2 instance type"
  value       = aws_instance.app.instance_type
}

output "environment" {
  description = "Environment name"
  value       = var.environment
}

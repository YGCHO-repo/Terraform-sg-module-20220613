output "account_id" {
  description = "AWS Account Id"
  value       = var.account_id
}

output "current_id" {
  description = "AWS Account current Id"
  value       = var.current_id
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "current_region" {
  description = "Your AWS current region"
  value       = var.current_region
}

output "aws_security_group" {
  description = "aws security group id"
  value       = aws_security_group.this.id
}
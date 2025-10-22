# ARN of the IAM role for RDS Enhanced Monitoring
output "monitoring_role_arn" {
  description = "The ARN of the IAM role used for RDS Enhanced Monitoring."
  value       = aws_iam_role.rds_monitoring.arn
}

# Name of the IAM role
output "monitoring_role_name" {
  description = "The name of the IAM role used for RDS Enhanced Monitoring."
  value       = aws_iam_role.rds_monitoring.name
}

# Role ID (useful for debugging or referencing in policies)
output "monitoring_role_id" {
  description = "The stable and unique string identifying the IAM role."
  value       = aws_iam_role.rds_monitoring.id
}

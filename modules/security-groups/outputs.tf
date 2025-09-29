output "security_group_ids" {
  description = "Map of SG names to IDs"
  value       = { for k, sg in aws_security_group.main : k => sg.id }
}

output "security_group_arns" {
  description = "Map of SG names to ARNs"
  value       = { for k, sg in aws_security_group.main : k => sg.arn }
}

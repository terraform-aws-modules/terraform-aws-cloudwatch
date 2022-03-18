output "cloudwatch_log_group_name" {
  description = "Name of Cloudwatch log group"
  value       = element(concat(aws_cloudwatch_log_group.this.*.name, [""]), 0)
}

output "cloudwatch_log_group_arn" {
  description = "ARN of Cloudwatch log group"
  value       = element(concat(aws_cloudwatch_log_group.this.*.arn, [""]), 0)
}

output "cloudwatch_log_group_resource_policy_ids" {
  description = "IDs of Cloudwatch Resource Policies"
  value       = { for name, policy in aws_cloudwatch_log_resource_policy.this : name => policy.id }
}

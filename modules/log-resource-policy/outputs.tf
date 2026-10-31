output "policy_name" {
  description = "Name of the CloudWatch Logs resource policy"
  value       = try(aws_cloudwatch_log_resource_policy.this[0].policy_name, null)
}

output "policy_document" {
  description = "Policy document applied to the CloudWatch Logs resource policy"
  value       = try(aws_cloudwatch_log_resource_policy.this[0].policy_document, null)
}

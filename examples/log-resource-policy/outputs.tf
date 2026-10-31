output "policy_name" {
  description = "Name of the CloudWatch Logs resource policy"
  value       = module.eventbridge_log_resource_policy.policy_name
}

output "log_group_arn" {
  description = "ARN of the log group the policy covers"
  value       = module.log_group.cloudwatch_log_group_arn
}

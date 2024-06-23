output "cloudwatch_log_group_name" {
  description = "Name of Cloudwatch log group"
  value       = module.log_group.cloudwatch_log_group_name
}

output "cloudwatch_log_group_arn" {
  description = "ARN of Cloudwatch log group"
  value       = module.log_group.cloudwatch_log_group_arn
}

output "cloudwatch_log_subscription_filter_name" {
  description = "Log subscription filter name"
  value       = module.log_subscription_filter.cloudwatch_log_subscription_filter_name
}

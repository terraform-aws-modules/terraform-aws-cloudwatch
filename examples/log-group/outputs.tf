output "basic_example_cloudwatch_log_group_name" {
  description = "Name of Cloudwatch log group"
  value       = module.basic_example.cloudwatch_log_group_name
}

output "basic_example_cloudwatch_log_group_arn" {
  description = "ARN of Cloudwatch log group"
  value       = module.basic_example.cloudwatch_log_group_arn
}

output "basic_example_cloudwatch_log_group_resource_policies" {
  description = "IDs of Cloudwatch Resource Policies"
  value       = module.basic_example.cloudwatch_log_group_resource_policies
}

output "advanced_example_cloudwatch_log_group_name" {
  description = "Name of Cloudwatch log group"
  value       = module.advanced_example.cloudwatch_log_group_name
}

output "advanced_example_cloudwatch_log_group_arn" {
  description = "ARN of Cloudwatch log group"
  value       = module.advanced_example.cloudwatch_log_group_arn
}

output "advanced_example_cloudwatch_log_group_resource_policies" {
  description = "IDs of Cloudwatch Resource Policies"
  value       = module.advanced_example.cloudwatch_log_group_resource_policies
}

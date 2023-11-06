output "cloudwatch_log_group_name" {
  description = "Name of Cloudwatch log group"
  value       = module.log_group.cloudwatch_log_group_name
}

output "cloudwatch_log_group_arn" {
  description = "ARN of Cloudwatch log group"
  value       = module.log_group.cloudwatch_log_group_arn
}

output "cloudwatch_query_definition_id" {
  description = "The query definition id"
  value       = module.query_definition.cloudwatch_query_definition_id
}

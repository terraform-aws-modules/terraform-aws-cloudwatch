output "cloudwatch_log_group_name" {
  description = "Name of Cloudwatch log group"
  value       = module.log_group.cloudwatch_log_group_name
}

output "cloudwatch_log_group_arn" {
  description = "ARN of Cloudwatch log group"
  value       = module.log_group.cloudwatch_log_group_arn
}

output "cloudwatch_log_stream_name" {
  description = "Name of Cloudwatch log stream"
  value       = module.log_stream.cloudwatch_log_stream_name
}

output "cloudwatch_log_stream_arn" {
  description = "ARN of Cloudwatch log stream"
  value       = module.log_stream.cloudwatch_log_stream_arn
}

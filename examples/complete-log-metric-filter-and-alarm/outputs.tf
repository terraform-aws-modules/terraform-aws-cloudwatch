output "cloudwatch_log_group_name" {
  description = "Name of Cloudwatch log group"
  value       = module.log_group.cloudwatch_log_group_name
}

output "cloudwatch_log_group_arn" {
  description = "ARN of Cloudwatch log group"
  value       = module.log_group.cloudwatch_log_group_arn
}

output "cloudwatch_log_metric_filter_id" {
  description = "The name of the metric filter"
  value       = module.log_metric_filter.cloudwatch_log_metric_filter_id
}

output "cloudwatch_metric_alarm_arn" {
  description = "The ARN of the Cloudwatch metric alarm"
  value       = module.alarm.cloudwatch_metric_alarm_arn
}

output "cloudwatch_metric_alarm_id" {
  description = "The ID of the Cloudwatch metric alarm"
  value       = module.alarm.cloudwatch_metric_alarm_id
}

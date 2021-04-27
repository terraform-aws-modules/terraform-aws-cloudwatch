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

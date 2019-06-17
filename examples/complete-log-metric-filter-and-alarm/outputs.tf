output "this_cloudwatch_log_metric_filter_id" {
  description = "The name of the metric filter"
  value       = module.log_metric_filter.this_cloudwatch_log_metric_filter_id
}
output "this_cloudwatch_metric_alarm_arn" {
  description = "The ARN of the Cloudwatch metric alarm"
  value       = module.alarm.this_cloudwatch_metric_alarm_arn
}

output "this_cloudwatch_metric_alarm_id" {
  description = "The ID of the Cloudwatch metric alarm"
  value       = module.alarm.this_cloudwatch_metric_alarm_id
}

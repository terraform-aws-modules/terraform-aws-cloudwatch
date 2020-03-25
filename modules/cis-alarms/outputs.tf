output "this_cloudwatch_metric_alarm_arns" {
  description = "List of ARNs of the Cloudwatch metric alarm"
  value       = { for k, v in aws_cloudwatch_metric_alarm.this : k => v.arn }
}

output "this_cloudwatch_metric_alarm_ids" {
  description = "List of IDs of the Cloudwatch metric alarm"
  value       = { for k, v in aws_cloudwatch_metric_alarm.this : k => v.id }
}

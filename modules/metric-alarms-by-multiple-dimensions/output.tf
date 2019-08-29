output "this_cloudwatch_metric_alarm_arns" {
  description = "List of ARN of the Cloudwatch metric alarms"
  value       = values(aws_cloudwatch_metric_alarm.this)[*].arn
}

output "this_cloudwatch_metric_alarm_ids" {
  description = "List of ID of the Cloudwatch metric alarms"
  value       = values(aws_cloudwatch_metric_alarm.this)[*].id
}

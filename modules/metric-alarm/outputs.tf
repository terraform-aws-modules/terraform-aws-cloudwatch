output "cloudwatch_metric_alarm_arn" {
  description = "The ARN of the Cloudwatch metric alarm."
  value       = one(aws_cloudwatch_metric_alarm.this[*].arn)
}

output "cloudwatch_metric_alarm_id" {
  description = "The ID of the Cloudwatch metric alarm."
  value       = one(aws_cloudwatch_metric_alarm.this[*].id)
}

output "cloudwatch_metric_alarm_arn" {
  description = "The ARN of the Cloudwatch metric alarm."
  value       = try(aws_cloudwatch_metric_alarm.this[0].arn, "")
}

output "cloudwatch_metric_alarm_id" {
  description = "The ID of the Cloudwatch metric alarm."
  value       = try(aws_cloudwatch_metric_alarm.this[0].id, "")
}

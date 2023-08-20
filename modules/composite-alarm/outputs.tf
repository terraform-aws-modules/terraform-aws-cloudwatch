output "cloudwatch_composite_alarm_arn" {
  description = "The ARN of the Cloudwatch composite alarm."
  value       = try(aws_cloudwatch_composite_alarm.this[0].arn, "")
}

output "cloudwatch_composite_alarm_id" {
  description = "The ID of the Cloudwatch composite alarm."
  value       = try(aws_cloudwatch_composite_alarm.this[0].id, "")
}

output "this_cloudwatch_metric_alarm_arn" {
  description = "The ARN of the Cloudwatch metric alarm"
  value       = module.alarm.this_cloudwatch_metric_alarm_arn
}

output "this_cloudwatch_metric_alarm_id" {
  description = "The ID of the Cloudwatch metric alarm"
  value       = module.alarm.this_cloudwatch_metric_alarm_id
}

output "this_lambda_function1_arn" {
  value = module.aws_lambda_function1.this_lambda_function_arn
}

output "this_lambda_function1_name" {
  value = module.aws_lambda_function1.this_lambda_function_name
}

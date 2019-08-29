output "this_cloudwatch_metric_alarm_arns" {
  description = "List of ARN of the Cloudwatch metric alarms"
  value       = module.alarms.this_cloudwatch_metric_alarm_arns
}

output "this_cloudwatch_metric_alarm_ids" {
  description = "List of ID of the Cloudwatch metric alarms"
  value       = module.alarms.this_cloudwatch_metric_alarm_ids
}

output "this_lambda_function1_arn" {
  value = module.aws_lambda_function1.this_lambda_function_arn
}

output "this_lambda_function1_name" {
  value = module.aws_lambda_function1.this_lambda_function_name
}

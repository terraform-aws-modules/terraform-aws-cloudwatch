output "cloudwatch_metric_alarm_arns" {
  description = "List of ARN of the Cloudwatch metric alarms"
  value       = module.alarms.cloudwatch_metric_alarm_arns
}

output "cloudwatch_metric_alarm_ids" {
  description = "List of ID of the Cloudwatch metric alarms"
  value       = module.alarms.cloudwatch_metric_alarm_ids
}

output "lambda_function1_arn" {
  description = "Lambda function ARN"
  value       = module.aws_lambda_function1.lambda_function_arn
}

output "lambda_function1_name" {
  description = "Lambda function name"
  value       = module.aws_lambda_function1.lambda_function_name
}

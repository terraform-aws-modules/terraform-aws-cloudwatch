output "cloudwatch_metric_alarm_arn" {
  description = "The ARN of the Cloudwatch metric alarm"
  value       = module.alarm.cloudwatch_metric_alarm_arn
}

output "cloudwatch_metric_alarm_id" {
  description = "The ID of the Cloudwatch metric alarm"
  value       = module.alarm.cloudwatch_metric_alarm_id
}

output "lambda_function1_arn" {
  description = "Lambda function ARN"
  value       = module.aws_lambda_function1.lambda_function_arn
}

output "lambda_function1_name" {
  description = "Lambda function name"
  value       = module.aws_lambda_function1.lambda_function_name
}

output "random_id" {
  description = "Id"
  value       = random_pet.this.id
}

output "lambda_function_arn" {
  description = "ARN"
  value       = aws_lambda_function.this.arn
}

output "lambda_function_name" {
  description = "Name"
  value       = aws_lambda_function.this.function_name
}

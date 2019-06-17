output "random_id" {
  value = random_pet.this.id
}

output "this_lambda_function_arn" {
  value = aws_lambda_function.this.arn
}

output "this_lambda_function_name" {
  value = aws_lambda_function.this.function_name
}

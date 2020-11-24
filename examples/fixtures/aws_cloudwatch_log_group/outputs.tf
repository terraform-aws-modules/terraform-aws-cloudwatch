output "random_id" {
  description = "Id"
  value       = random_pet.this.id
}

output "this_cloudwatch_log_group_arn" {
  description = "ARN"
  value       = aws_cloudwatch_log_group.this.arn
}

output "this_cloudwatch_log_group_name" {
  description = "Name"
  value       = aws_cloudwatch_log_group.this.name
}

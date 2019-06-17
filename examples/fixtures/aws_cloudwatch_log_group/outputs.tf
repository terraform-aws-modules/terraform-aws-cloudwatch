output "random_id" {
  value = random_pet.this.id
}

output "this_cloudwatch_log_group_arn" {
  value = aws_cloudwatch_log_group.this.arn
}

output "this_cloudwatch_log_group_name" {
  value = aws_cloudwatch_log_group.this.name
}

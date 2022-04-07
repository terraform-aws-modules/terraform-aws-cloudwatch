output "cloudwatch_log_stream_name" {
  description = "Name of Cloudwatch log stream"
  value       = try(aws_cloudwatch_log_stream.this[0].name, "")
}

output "cloudwatch_log_stream_arn" {
  description = "ARN of Cloudwatch log stream"
  value       = try(aws_cloudwatch_log_stream.this[0].arn, "")
}

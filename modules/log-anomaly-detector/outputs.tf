output "arn" {
  description = "The ARN of the anomaly detector."
  value       = try(aws_cloudwatch_log_anomaly_detector.this[0].arn, null)
}

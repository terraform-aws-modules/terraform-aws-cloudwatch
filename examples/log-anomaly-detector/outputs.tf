output "cloudwatch_log_anomaly_arn" {
  description = "The ARN of the anomaly detector."
  value       = module.log_anomaly_detector.arn
}

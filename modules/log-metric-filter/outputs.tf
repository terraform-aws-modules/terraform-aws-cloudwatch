output "cloudwatch_log_metric_filter_id" {
  description = "The name of the metric filter"
  value       = try(aws_cloudwatch_log_metric_filter.this[0].id, "")
}

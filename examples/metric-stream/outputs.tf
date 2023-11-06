output "exclude_example_metric_stream" {
  description = "ARN of the metric stream."
  value       = module.stream_with_exclude_filter.cloudwatch_metric_stream
}

output "exclude_example_metric_stream_creation_date" {
  description = "Date and time in RFC3339 format that the metric stream was created."
  value       = module.stream_with_exclude_filter.cloudwatch_metric_stream_creation_date
}

output "exclude_example_metric_stream_last_update_date" {
  description = "Date and time in RFC3339 format that the metric stream was last updated."
  value       = module.stream_with_exclude_filter.cloudwatch_metric_stream_last_update_date
}

output "exclude_example_metric_stream_state" {
  description = "State of the metric stream. Possible values are running and stopped."
  value       = module.stream_with_exclude_filter.cloudwatch_metric_stream_state
}

output "include_example_metric_stream" {
  description = "ARN of the metric stream."
  value       = module.stream_with_include_filter.cloudwatch_metric_stream
}

output "include_example_metric_stream_creation_date" {
  description = "Date and time in RFC3339 format that the metric stream was created."
  value       = module.stream_with_include_filter.cloudwatch_metric_stream_creation_date
}

output "include_example_metric_stream_last_update_date" {
  description = "Date and time in RFC3339 format that the metric stream was last updated."
  value       = module.stream_with_include_filter.cloudwatch_metric_stream_last_update_date
}

output "include_example_metric_stream_state" {
  description = "State of the metric stream. Possible values are running and stopped."
  value       = module.stream_with_include_filter.cloudwatch_metric_stream_state
}

output "all_example_metric_stream" {
  description = "ARN of the metric stream."
  value       = module.stream_all.cloudwatch_metric_stream
}

output "all_example_metric_stream_creation_date" {
  description = "Date and time in RFC3339 format that the metric stream was created."
  value       = module.stream_all.cloudwatch_metric_stream_creation_date
}

output "all_example_metric_stream_last_update_date" {
  description = "Date and time in RFC3339 format that the metric stream was last updated."
  value       = module.stream_all.cloudwatch_metric_stream_last_update_date
}

output "all_example_metric_stream_state" {
  description = "State of the metric stream. Possible values are running and stopped."
  value       = module.stream_all.cloudwatch_metric_stream_state
}

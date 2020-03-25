output "this_cloudwatch_metric_alarm_arns" {
  description = "List of ARNs of the Cloudwatch metric alarm"
  value       = module.all_cis_alarms.this_cloudwatch_metric_alarm_arns
}

output "this_cloudwatch_metric_alarm_ids" {
  description = "List of IDs of the Cloudwatch metric alarm"
  value       = module.all_cis_alarms.this_cloudwatch_metric_alarm_ids
}

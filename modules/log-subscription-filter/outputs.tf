output "cloudwatch_log_subscription_filter_name" {
  description = "Log subscription filter name"
  value       = try(var.log_group_name, null)
}

output "log_account_data_retention_policy_name" {
  description = "Name of Cloudwatch log account policy"
  value       = module.log_account_data_retention_policy.log_account_policy_name
}

output "log_account_subscription_filter_retention_policy_name" {
  description = "Name of Cloudwatch log account policy"
  value       = module.log_account_subscription_filter_policy.log_account_policy_name
}

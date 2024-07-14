module "wrapper" {
  source = "../../modules/log-account-policy"

  for_each = var.items

  audit_statement_sid                           = try(each.value.audit_statement_sid, var.defaults.audit_statement_sid, "audit-policy")
  create                                        = try(each.value.create, var.defaults.create, true)
  create_log_data_protection_policy             = try(each.value.create_log_data_protection_policy, var.defaults.create_log_data_protection_policy, false)
  data_identifiers                              = try(each.value.data_identifiers, var.defaults.data_identifiers, null)
  deidentify_statement_sid                      = try(each.value.deidentify_statement_sid, var.defaults.deidentify_statement_sid, "redact-policy")
  findings_destination_cloudwatch_log_group     = try(each.value.findings_destination_cloudwatch_log_group, var.defaults.findings_destination_cloudwatch_log_group, null)
  findings_destination_firehose_delivery_stream = try(each.value.findings_destination_firehose_delivery_stream, var.defaults.findings_destination_firehose_delivery_stream, null)
  findings_destination_s3_bucket                = try(each.value.findings_destination_s3_bucket, var.defaults.findings_destination_s3_bucket, null)
  log_account_policy_name                       = try(each.value.log_account_policy_name, var.defaults.log_account_policy_name, null)
  log_account_policy_scope                      = try(each.value.log_account_policy_scope, var.defaults.log_account_policy_scope, null)
  log_account_policy_selection_criteria         = try(each.value.log_account_policy_selection_criteria, var.defaults.log_account_policy_selection_criteria, null)
  log_account_policy_type                       = try(each.value.log_account_policy_type, var.defaults.log_account_policy_type, "audit-policy")
  log_data_protection_description               = try(each.value.log_data_protection_description, var.defaults.log_data_protection_description, null)
  log_data_protection_policy_name               = try(each.value.log_data_protection_policy_name, var.defaults.log_data_protection_policy_name, null)
  policy_document                               = try(each.value.policy_document, var.defaults.policy_document, null)
}

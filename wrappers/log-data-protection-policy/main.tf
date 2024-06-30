module "wrapper" {
  source = "../../modules/log-data-protection-policy"

  for_each = var.items

  create                                        = try(each.value.create, var.defaults.create, true)
  create_log_data_protection_policy             = try(each.value.create_log_data_protection_policy, var.defaults.create_log_data_protection_policy, false)
  log_group_name                                = try(each.value.log_group_name, var.defaults.log_group_name, null)
  policy_document                               = try(each.value.policy_document, var.defaults.policy_document, null)
  log_data_protection_policy_name               = try(each.value.log_data_protection_policy_name, var.defaults.log_data_protection_policy_name, null)
  log_data_protection_description               = try(each.value.log_data_protection_description, var.defaults.log_data_protection_description, null)
  audit_statement_sid                           = try(each.value.audit_statement_sid, var.defaults.audit_statement_sid, "audit-policy")
  deidentify_statement_sid                      = try(each.value.deidentify_statement_sid, var.defaults.deidentify_statement_sid, "redact-policy")
  data_identifiers                              = try(each.value.data_identifiers, var.defaults.data_identifiers, null)
  findings_destination_cloudwatch_log_group     = try(each.value.findings_destination_cloudwatch_log_group, var.defaults.findings_destination_cloudwatch_log_group, null)
  findings_destination_firehose_delivery_stream = try(each.value.findings_destination_firehose_delivery_stream, var.defaults.findings_destination_firehose_delivery_stream, null)
  findings_destination_s3_bucket                = try(each.value.findings_destination_s3_bucket, var.defaults.findings_destination_s3_bucket, null)
}

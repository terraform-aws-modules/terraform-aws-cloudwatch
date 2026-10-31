module "wrapper" {
  source = "../../modules/log-resource-policy"

  for_each = var.items

  actions                = try(each.value.actions, var.defaults.actions, ["logs:CreateLogStream", "logs:PutLogEvents"])
  create                 = try(each.value.create, var.defaults.create, true)
  log_group_arn_patterns = try(each.value.log_group_arn_patterns, var.defaults.log_group_arn_patterns, [])
  policy_document        = try(each.value.policy_document, var.defaults.policy_document, null)
  policy_name            = try(each.value.policy_name, var.defaults.policy_name)
  service_principals     = try(each.value.service_principals, var.defaults.service_principals, [])
  sid                    = try(each.value.sid, var.defaults.sid, "AllowServiceToWriteLogs")
  source_arn_patterns    = try(each.value.source_arn_patterns, var.defaults.source_arn_patterns, null)
}

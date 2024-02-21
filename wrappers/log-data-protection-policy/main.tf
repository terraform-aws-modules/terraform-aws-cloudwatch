module "wrapper" {
  source = "../../modules/log-data-protection-policy"

  for_each = var.items

  create          = try(each.value.create, var.defaults.create, true)
  log_group_name  = try(each.value.log_group_name, var.defaults.log_group_name, null)
  policy_document = try(each.value.policy_document, var.defaults.policy_document, null)
}

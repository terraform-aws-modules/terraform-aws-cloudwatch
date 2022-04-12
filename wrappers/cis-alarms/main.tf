module "wrapper" {
  source = "../../modules/cis-alarms"

  for_each = var.items

  create                 = try(each.value.create, true)
  use_random_name_prefix = try(each.value.use_random_name_prefix, false)
  name_prefix            = try(each.value.name_prefix, "")
  disabled_controls      = try(each.value.disabled_controls, [])
  namespace              = try(each.value.namespace, "CISBenchmark")
  log_group_name         = try(each.value.log_group_name, "")
  alarm_actions          = try(each.value.alarm_actions, [])
  actions_enabled        = try(each.value.actions_enabled, true)
  tags                   = try(each.value.tags, {})
}

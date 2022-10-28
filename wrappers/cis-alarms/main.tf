module "wrapper" {
  source = "../../modules/cis-alarms"

  for_each = var.items

  create                    = try(each.value.create, var.defaults.create, true)
  use_random_name_prefix    = try(each.value.use_random_name_prefix, var.defaults.use_random_name_prefix, false)
  name_prefix               = try(each.value.name_prefix, var.defaults.name_prefix, "")
  control_overrides         = try(each.value.control_overrides, var.defaults.control_overrides, {})
  disabled_controls         = try(each.value.disabled_controls, var.defaults.disabled_controls, [])
  namespace                 = try(each.value.namespace, var.defaults.namespace, "CISBenchmark")
  log_group_name            = try(each.value.log_group_name, var.defaults.log_group_name, "")
  alarm_actions             = try(each.value.alarm_actions, var.defaults.alarm_actions, [])
  actions_enabled           = try(each.value.actions_enabled, var.defaults.actions_enabled, true)
  tags                      = try(each.value.tags, var.defaults.tags, {})
  ok_actions                = try(each.value.ok_actions, var.defaults.ok_actions, [])
  insufficient_data_actions = try(each.value.insufficient_data_actions, var.defaults.insufficient_data_actions, [])
}

module "wrapper" {
  source = "../../modules/composite-alarm"

  for_each = var.items

  actions_enabled           = try(each.value.actions_enabled, var.defaults.actions_enabled, true)
  actions_suppressor        = try(each.value.actions_suppressor, var.defaults.actions_suppressor, {})
  alarm_actions             = try(each.value.alarm_actions, var.defaults.alarm_actions, null)
  alarm_description         = try(each.value.alarm_description, var.defaults.alarm_description, null)
  alarm_name                = try(each.value.alarm_name, var.defaults.alarm_name, null)
  alarm_rule                = try(each.value.alarm_rule, var.defaults.alarm_rule, null)
  create                    = try(each.value.create, var.defaults.create, true)
  insufficient_data_actions = try(each.value.insufficient_data_actions, var.defaults.insufficient_data_actions, null)
  ok_actions                = try(each.value.ok_actions, var.defaults.ok_actions, null)
  tags                      = try(each.value.tags, var.defaults.tags, {})
}

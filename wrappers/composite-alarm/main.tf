module "wrapper" {
  source = "../../modules/composite-alarm"

  for_each = var.items

  create_composite_alarm    = try(each.value.create_composite_alarm, var.defaults.create_composite_alarm, true)
  alarm_name                = try(each.value.alarm_name, var.defaults.alarm_name)
  alarm_description         = try(each.value.alarm_description, var.defaults.alarm_description, null)
  actions_enabled           = try(each.value.actions_enabled, var.defaults.actions_enabled, true)
  actions_suppressor        = try(each.value.actions_suppressor, var.defaults.actions_suppressor, {})
  alarm_actions             = try(each.value.alarm_actions, var.defaults.alarm_actions, null)
  insufficient_data_actions = try(each.value.insufficient_data_actions, var.defaults.insufficient_data_actions, null)
  ok_actions                = try(each.value.ok_actions, var.defaults.ok_actions, null)
  alarm_rule                = try(each.value.alarm_rule, var.defaults.alarm_rule)
  tags                      = try(each.value.tags, var.defaults.tags, {})
}

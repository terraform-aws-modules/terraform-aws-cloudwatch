resource "aws_cloudwatch_composite_alarm" "this" {
  count = var.create_composite_alarm ? 1 : 0

  alarm_name        = var.alarm_name
  alarm_description = var.alarm_description
  actions_enabled   = var.actions_enabled

  alarm_actions             = var.alarm_actions
  ok_actions                = var.ok_actions
  insufficient_data_actions = var.insufficient_data_actions
  alarm_rule                = var.alarm_rule

  dynamic "actions_suppressor" {
    for_each = length(var.actions_suppresor) > 0 ? [var.actions_suppresor] : []

    content {
      alarm            = actions_suppressor.value.alarm
      extension_period = actions_suppressor.value.extension_period
      wait_period      = actions_suppressor.value.wait_period
    }
  }

  tags = var.tags
}

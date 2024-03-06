module "wrapper" {
  source = "../../modules/metric-alarm"

  for_each = var.items

  actions_enabled                       = try(each.value.actions_enabled, var.defaults.actions_enabled, true)
  alarm_actions                         = try(each.value.alarm_actions, var.defaults.alarm_actions, null)
  alarm_description                     = try(each.value.alarm_description, var.defaults.alarm_description, null)
  alarm_name                            = try(each.value.alarm_name, var.defaults.alarm_name)
  comparison_operator                   = try(each.value.comparison_operator, var.defaults.comparison_operator)
  create_metric_alarm                   = try(each.value.create_metric_alarm, var.defaults.create_metric_alarm, true)
  datapoints_to_alarm                   = try(each.value.datapoints_to_alarm, var.defaults.datapoints_to_alarm, null)
  dimensions                            = try(each.value.dimensions, var.defaults.dimensions, null)
  evaluate_low_sample_count_percentiles = try(each.value.evaluate_low_sample_count_percentiles, var.defaults.evaluate_low_sample_count_percentiles, null)
  evaluation_periods                    = try(each.value.evaluation_periods, var.defaults.evaluation_periods)
  extended_statistic                    = try(each.value.extended_statistic, var.defaults.extended_statistic, null)
  insufficient_data_actions             = try(each.value.insufficient_data_actions, var.defaults.insufficient_data_actions, null)
  metric_name                           = try(each.value.metric_name, var.defaults.metric_name, null)
  metric_query                          = try(each.value.metric_query, var.defaults.metric_query, [])
  namespace                             = try(each.value.namespace, var.defaults.namespace, null)
  ok_actions                            = try(each.value.ok_actions, var.defaults.ok_actions, null)
  period                                = try(each.value.period, var.defaults.period, null)
  statistic                             = try(each.value.statistic, var.defaults.statistic, null)
  tags                                  = try(each.value.tags, var.defaults.tags, {})
  threshold                             = try(each.value.threshold, var.defaults.threshold, null)
  threshold_metric_id                   = try(each.value.threshold_metric_id, var.defaults.threshold_metric_id, null)
  treat_missing_data                    = try(each.value.treat_missing_data, var.defaults.treat_missing_data, "missing")
  unit                                  = try(each.value.unit, var.defaults.unit, null)
}

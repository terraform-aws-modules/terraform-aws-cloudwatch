module "wrapper" {
  source = "../../modules/metric-alarm"

  for_each = var.items

  create_metric_alarm                   = try(each.value.create_metric_alarm, var.defaults.create_metric_alarm, true)
  alarm_name                            = try(each.value.alarm_name, var.defaults.alarm_name)
  alarm_description                     = try(each.value.alarm_description, var.defaults.alarm_description, null)
  comparison_operator                   = try(each.value.comparison_operator, var.defaults.comparison_operator)
  evaluation_periods                    = try(each.value.evaluation_periods, var.defaults.evaluation_periods)
  threshold                             = try(each.value.threshold, var.defaults.threshold, null)
  threshold_metric_id                   = try(each.value.threshold_metric_id, var.defaults.threshold_metric_id, null)
  unit                                  = try(each.value.unit, var.defaults.unit, null)
  metric_name                           = try(each.value.metric_name, var.defaults.metric_name, null)
  namespace                             = try(each.value.namespace, var.defaults.namespace, null)
  period                                = try(each.value.period, var.defaults.period, null)
  statistic                             = try(each.value.statistic, var.defaults.statistic, null)
  actions_enabled                       = try(each.value.actions_enabled, var.defaults.actions_enabled, true)
  datapoints_to_alarm                   = try(each.value.datapoints_to_alarm, var.defaults.datapoints_to_alarm, null)
  dimensions                            = try(each.value.dimensions, var.defaults.dimensions, null)
  alarm_actions                         = try(each.value.alarm_actions, var.defaults.alarm_actions, null)
  insufficient_data_actions             = try(each.value.insufficient_data_actions, var.defaults.insufficient_data_actions, null)
  ok_actions                            = try(each.value.ok_actions, var.defaults.ok_actions, null)
  extended_statistic                    = try(each.value.extended_statistic, var.defaults.extended_statistic, null)
  treat_missing_data                    = try(each.value.treat_missing_data, var.defaults.treat_missing_data, "missing")
  evaluate_low_sample_count_percentiles = try(each.value.evaluate_low_sample_count_percentiles, var.defaults.evaluate_low_sample_count_percentiles, null)
  metric_query                          = try(each.value.metric_query, var.defaults.metric_query, [])
  tags                                  = try(each.value.tags, var.defaults.tags, {})
}

module "wrapper" {
  source = "../../modules/metric-alarm"

  for_each = var.items

  create_metric_alarm                   = try(each.value.create_metric_alarm, true)
  alarm_name                            = each.value.alarm_name
  alarm_description                     = try(each.value.alarm_description, null)
  comparison_operator                   = each.value.comparison_operator
  evaluation_periods                    = each.value.evaluation_periods
  threshold                             = try(each.value.threshold, null)
  threshold_metric_id                   = try(each.value.threshold_metric_id, null)
  unit                                  = try(each.value.unit, null)
  metric_name                           = try(each.value.metric_name, null)
  namespace                             = try(each.value.namespace, null)
  period                                = try(each.value.period, null)
  statistic                             = try(each.value.statistic, null)
  actions_enabled                       = try(each.value.actions_enabled, true)
  datapoints_to_alarm                   = try(each.value.datapoints_to_alarm, null)
  dimensions                            = try(each.value.dimensions, null)
  alarm_actions                         = try(each.value.alarm_actions, null)
  insufficient_data_actions             = try(each.value.insufficient_data_actions, null)
  ok_actions                            = try(each.value.ok_actions, null)
  extended_statistic                    = try(each.value.extended_statistic, null)
  treat_missing_data                    = try(each.value.treat_missing_data, "missing")
  evaluate_low_sample_count_percentiles = try(each.value.evaluate_low_sample_count_percentiles, null)
  metric_query                          = try(each.value.metric_query, [])
  tags                                  = try(each.value.tags, {})
}

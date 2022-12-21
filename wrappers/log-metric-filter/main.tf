module "wrapper" {
  source = "../../modules/log-metric-filter"

  for_each = var.items

  create_cloudwatch_log_metric_filter = try(each.value.create_cloudwatch_log_metric_filter, var.defaults.create_cloudwatch_log_metric_filter, true)
  name                                = try(each.value.name, var.defaults.name)
  pattern                             = try(each.value.pattern, var.defaults.pattern)
  log_group_name                      = try(each.value.log_group_name, var.defaults.log_group_name)
  metric_transformation_name          = try(each.value.metric_transformation_name, var.defaults.metric_transformation_name)
  metric_transformation_namespace     = try(each.value.metric_transformation_namespace, var.defaults.metric_transformation_namespace)
  metric_transformation_value         = try(each.value.metric_transformation_value, var.defaults.metric_transformation_value, "1")
  metric_transformation_default_value = try(each.value.metric_transformation_default_value, var.defaults.metric_transformation_default_value, null)
  metric_transformation_unit          = try(each.value.metric_transformation_unit, var.defaults.metric_transformation_unit, "None")
}

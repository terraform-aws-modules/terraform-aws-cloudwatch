module "wrapper" {
  source = "../../modules/log-metric-filter"

  for_each = var.items

  create_cloudwatch_log_metric_filter = try(each.value.create_cloudwatch_log_metric_filter, true)
  name                                = each.value.name
  pattern                             = each.value.pattern
  log_group_name                      = each.value.log_group_name
  metric_transformation_name          = each.value.metric_transformation_name
  metric_transformation_namespace     = each.value.metric_transformation_namespace
  metric_transformation_value         = try(each.value.metric_transformation_value, "1")
  metric_transformation_default_value = try(each.value.metric_transformation_default_value, null)
}

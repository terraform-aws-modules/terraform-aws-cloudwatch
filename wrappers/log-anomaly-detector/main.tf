module "wrapper" {
  source = "../../modules/log-anomaly-detector"

  for_each = var.items

  anomaly_visibility_time = try(each.value.anomaly_visibility_time, var.defaults.anomaly_visibility_time, null)
  create                  = try(each.value.create, var.defaults.create, true)
  detector_name           = try(each.value.detector_name, var.defaults.detector_name, null)
  enabled                 = try(each.value.enabled, var.defaults.enabled, null)
  evaluation_frequency    = try(each.value.evaluation_frequency, var.defaults.evaluation_frequency, null)
  filter_pattern          = try(each.value.filter_pattern, var.defaults.filter_pattern, null)
  kms_key_id              = try(each.value.kms_key_id, var.defaults.kms_key_id, null)
  log_group_arns          = try(each.value.log_group_arns, var.defaults.log_group_arns, null)
}

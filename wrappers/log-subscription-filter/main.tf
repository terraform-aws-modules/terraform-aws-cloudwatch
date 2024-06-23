module "wrapper" {
  source = "../../modules/log-subscription-filter"

  for_each = var.items

  create          = try(each.value.create, var.defaults.create, true)
  destination_arn = try(each.value.destination_arn, var.defaults.destination_arn, null)
  distribution    = try(each.value.distribution, var.defaults.distribution, null)
  filter_pattern  = try(each.value.filter_pattern, var.defaults.filter_pattern, "")
  log_group_name  = try(each.value.log_group_name, var.defaults.log_group_name, null)
  name            = try(each.value.name, var.defaults.name, null)
  role_arn        = try(each.value.role_arn, var.defaults.role_arn, null)
}

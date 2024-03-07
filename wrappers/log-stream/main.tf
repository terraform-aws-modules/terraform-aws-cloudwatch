module "wrapper" {
  source = "../../modules/log-stream"

  for_each = var.items

  create         = try(each.value.create, var.defaults.create, true)
  log_group_name = try(each.value.log_group_name, var.defaults.log_group_name, null)
  name           = try(each.value.name, var.defaults.name, null)
}

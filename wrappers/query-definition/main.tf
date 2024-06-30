module "wrapper" {
  source = "../../modules/query-definition"

  for_each = var.items

  create          = try(each.value.create, var.defaults.create, true)
  log_group_names = try(each.value.log_group_names, var.defaults.log_group_names, null)
  name            = try(each.value.name, var.defaults.name)
  query_string    = try(each.value.query_string, var.defaults.query_string)
}

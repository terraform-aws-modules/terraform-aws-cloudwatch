module "wrapper" {
  source = "../../modules/log-stream"

  for_each = var.items

  create         = try(each.value.create, true)
  name           = try(each.value.name, null)
  log_group_name = try(each.value.log_group_name, null)
}

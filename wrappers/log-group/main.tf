module "wrapper" {
  source = "../../modules/log-group"

  for_each = var.items

  create            = try(each.value.create, var.defaults.create, true)
  name              = try(each.value.name, var.defaults.name, null)
  name_prefix       = try(each.value.name_prefix, var.defaults.name_prefix, null)
  retention_in_days = try(each.value.retention_in_days, var.defaults.retention_in_days, null)
  kms_key_id        = try(each.value.kms_key_id, var.defaults.kms_key_id, null)
  tags              = try(each.value.tags, var.defaults.tags, {})
}

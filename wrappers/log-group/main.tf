module "wrapper" {
  source = "../../modules/log-group"

  for_each = var.items

  create                      = try(each.value.create, var.defaults.create, true)
  deletion_protection_enabled = try(each.value.deletion_protection_enabled, var.defaults.deletion_protection_enabled, null)
  kms_key_id                  = try(each.value.kms_key_id, var.defaults.kms_key_id, null)
  log_group_class             = try(each.value.log_group_class, var.defaults.log_group_class, null)
  name                        = try(each.value.name, var.defaults.name, null)
  name_prefix                 = try(each.value.name_prefix, var.defaults.name_prefix, null)
  retention_in_days           = try(each.value.retention_in_days, var.defaults.retention_in_days, null)
  skip_destroy                = try(each.value.skip_destroy, var.defaults.skip_destroy, null)
  tags                        = try(each.value.tags, var.defaults.tags, {})
}

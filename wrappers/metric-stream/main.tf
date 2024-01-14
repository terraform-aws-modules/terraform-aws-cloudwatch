module "wrapper" {
  source = "../../modules/metric-stream"

  for_each = var.items

  create                   = try(each.value.create, var.defaults.create, true)
  name                     = try(each.value.name, var.defaults.name, null)
  name_prefix              = try(each.value.name_prefix, var.defaults.name_prefix, null)
  firehose_arn             = try(each.value.firehose_arn, var.defaults.firehose_arn)
  role_arn                 = try(each.value.role_arn, var.defaults.role_arn)
  output_format            = try(each.value.output_format, var.defaults.output_format)
  exclude_filter           = try(each.value.exclude_filter, var.defaults.exclude_filter, {})
  include_filter           = try(each.value.include_filter, var.defaults.include_filter, {})
  statistics_configuration = try(each.value.statistics_configuration, var.defaults.statistics_configuration, [])
  tags                     = try(each.value.tags, var.defaults.tags, {})
}

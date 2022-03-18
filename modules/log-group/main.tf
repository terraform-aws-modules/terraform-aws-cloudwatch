resource "aws_cloudwatch_log_group" "this" {
  count = var.create ? 1 : 0

  name              = var.name
  name_prefix       = var.name_prefix
  retention_in_days = var.retention_in_days
  kms_key_id        = var.kms_key_id

  tags = var.tags
}

resource "aws_cloudwatch_log_resource_policy" "this" {
  for_each = var.create ? var.resource_policies : {}

  policy_name     = each.key
  policy_document = each.value
}

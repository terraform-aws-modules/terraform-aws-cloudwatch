resource "aws_cloudwatch_log_group" "this" {
  count = var.create ? 1 : 0

  name              = var.name
  name_prefix       = var.name_prefix
  retention_in_days = var.retention_in_days
  kms_key_id        = var.kms_key_id
  log_group_class   = var.log_group_class
  skip_destroy      = var.skip_destroy

  tags = var.tags
}

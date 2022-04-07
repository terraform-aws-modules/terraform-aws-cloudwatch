resource "aws_cloudwatch_log_stream" "this" {
  count = var.create ? 1 : 0

  name           = var.name
  log_group_name = var.log_group_name
}

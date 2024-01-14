resource "aws_cloudwatch_query_definition" "this" {
  count = var.create ? 1 : 0

  name            = var.name
  query_string    = var.query_string
  log_group_names = var.log_group_names
}

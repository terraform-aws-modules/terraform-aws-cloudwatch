locals {
  resource_policies = merge(var.resource_policies, {
    for index, service in var.allowed_services :
    service => data.aws_iam_policy_document.allowed_services[index].json
  })
}

resource "aws_cloudwatch_log_group" "this" {
  count = var.create ? 1 : 0

  name              = var.name
  name_prefix       = var.name_prefix
  retention_in_days = var.retention_in_days
  kms_key_id        = var.kms_key_id

  tags = var.tags
}

resource "aws_cloudwatch_log_resource_policy" "this" {
  for_each = var.create ? local.resource_policies : {}

  policy_name     = each.key
  policy_document = each.value
}

data "aws_iam_policy_document" "allowed_services" {
  for_each = var.allowed_services

  statement {
    principals {
      type        = "Service"
      identifiers = ["${each.value}.amazonaws.com"]
    }
    actions = [
      "logs:PutLogEvents",
      "logs:CreateLogStream",
    ]
    resources = ["${join("", aws_cloudwatch_log_group.this.*.arn)}/*"]
  }
}

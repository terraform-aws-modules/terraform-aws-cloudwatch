data "aws_iam_policy_document" "this" {
  count = var.create && var.policy_document == null ? 1 : 0

  statement {
    sid       = var.sid
    effect    = "Allow"
    actions   = var.actions
    resources = var.log_group_arn_patterns

    principals {
      type        = "Service"
      identifiers = var.service_principals
    }

    dynamic "condition" {
      for_each = var.source_arn_patterns == null ? [] : [1]

      content {
        test     = "ArnLike"
        variable = "aws:SourceArn"
        values   = var.source_arn_patterns
      }
    }
  }
}

resource "aws_cloudwatch_log_resource_policy" "this" {
  count = var.create ? 1 : 0

  policy_name     = var.policy_name
  policy_document = var.policy_document != null ? var.policy_document : data.aws_iam_policy_document.this[0].json
}

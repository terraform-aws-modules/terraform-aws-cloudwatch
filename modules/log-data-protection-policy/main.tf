resource "aws_cloudwatch_log_data_protection_policy" "this" {
  count = var.create ? 1 : 0

  log_group_name  = var.log_group_name
  policy_document = var.create_log_data_protection_policy ? data.aws_cloudwatch_log_data_protection_policy_document.this[0].json : var.policy_document
}

data "aws_cloudwatch_log_data_protection_policy_document" "this" {
  count = var.create && var.create_log_data_protection_policy ? 1 : 0

  name        = var.log_data_protection_policy_name
  description = var.log_data_protection_description

  statement {
    sid              = var.audit_statement_sid
    data_identifiers = var.data_identifiers

    operation {
      audit {
        findings_destination {

          dynamic "cloudwatch_logs" {
            for_each = var.findings_destination_cloudwatch_log_group != null ? [true] : []

            content {
              log_group = var.findings_destination_cloudwatch_log_group
            }
          }

          dynamic "firehose" {
            for_each = var.findings_destination_firehose_delivery_stream != null ? [true] : []

            content {
              delivery_stream = var.findings_destination_firehose_delivery_stream
            }
          }

          dynamic "s3" {
            for_each = var.findings_destination_s3_bucket != null ? [true] : []

            content {
              bucket = var.findings_destination_s3_bucket
            }
          }
        }
      }
    }
  }

  statement {
    sid              = var.deidentify_statement_sid
    data_identifiers = var.data_identifiers

    operation {
      deidentify {
        mask_config {}
      }
    }
  }
}

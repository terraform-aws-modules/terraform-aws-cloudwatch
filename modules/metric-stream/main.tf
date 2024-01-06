resource "aws_cloudwatch_metric_stream" "this" {
  count = var.create ? 1 : 0

  name        = var.name
  name_prefix = var.name_prefix

  firehose_arn  = var.firehose_arn
  role_arn      = var.role_arn
  output_format = var.output_format

  dynamic "exclude_filter" {
    for_each = var.exclude_filter

    content {
      namespace    = exclude_filter.value.namespace
      metric_names = try(exclude_filter.value.metric_names, [])
    }
  }

  dynamic "include_filter" {
    for_each = var.include_filter

    content {
      namespace    = include_filter.value.namespace
      metric_names = try(include_filter.value.metric_names, [])
    }
  }

  dynamic "statistics_configuration" {
    for_each = var.statistics_configuration

    content {
      additional_statistics = statistics_configuration.value.additional_statistics

      dynamic "include_metric" {
        for_each = statistics_configuration.value.include_metric

        content {
          metric_name = include_metric.value.metric_name
          namespace   = include_metric.value.namespace
        }
      }
    }
  }

  tags = var.tags
}

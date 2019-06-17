provider "aws" {
  region = "eu-west-1"
}

module "aws_sns_topic" {
  source = "../fixtures/aws_sns_topic"
}

module "log" {
  source = "../fixtures/aws_cloudwatch_log_group"
}

locals {
  metric_transformation_name      = "ErrorCount"
  metric_transformation_namespace = "MyAppNamespace"
}

module "log_metric_filter" {
  source = "../../modules/log-metric-filter"

  log_group_name = module.log.this_cloudwatch_log_group_name

  name    = "metric-${module.log.random_id}"
  pattern = "ERROR"

  metric_transformation_namespace = local.metric_transformation_namespace
  metric_transformation_name      = local.metric_transformation_name
}

module "alarm" {
  source = "../../modules/metric-alarm"

  alarm_name          = "log-errors-${module.log.random_id}"
  alarm_description   = "Log errors are too high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  threshold           = 10
  period              = 60
  unit                = "Count"

  namespace   = local.metric_transformation_namespace
  metric_name = local.metric_transformation_name
  statistic   = "Sum"

  alarm_actions = [module.aws_sns_topic.this_sns_topic_arn]
}

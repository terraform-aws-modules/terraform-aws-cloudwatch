provider "aws" {
  region = "eu-west-1"
}

locals {
  tags = {
    example = "composite-alarm"
    region  = "eu-west-1"
  }
}

module "composite_alarm" {
  source = "../../modules/composite-alarm"

  alarm_name        = "composite-alarm"
  alarm_description = "Example of a composite alarm"

  alarm_actions = [module.aws_sns_topic_2.sns_topic_arn]
  ok_actions    = [module.aws_sns_topic_2.sns_topic_arn]

  # https://github.com/hashicorp/terraform-provider-aws/issues/19575
  alarm_rule = join(" AND ", tolist([
    "ALARM(${module.lambda_duration_alarm.cloudwatch_metric_alarm_id})",
    "ALARM(${module.all_lambdas_errors_alarm.cloudwatch_metric_alarm_id})"
  ]))

  actions_suppressor = {
    alarm            = module.suppressor.cloudwatch_metric_alarm_id
    extension_period = 20
    wait_period      = 10
  }

  tags = local.tags
}

################################################################################
# Supporting Resources
################################################################################

module "aws_sns_topic_1" {
  source = "../fixtures/aws_sns_topic"
}

module "aws_sns_topic_2" {
  source = "../fixtures/aws_sns_topic"
}

module "aws_lambda_function1" {
  source = "../fixtures/aws_lambda_function"
}

module "lambda_duration_alarm" {
  source = "../../modules/metric-alarm"

  alarm_name          = "lambda-duration"
  alarm_description   = "Lambda duration is too high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  threshold           = 10
  period              = 60
  unit                = "Milliseconds"

  namespace   = "AWS/Lambda"
  metric_name = "Duration"
  statistic   = "Maximum"

  dimensions = {
    FunctionName = module.aws_lambda_function1.lambda_function_name
  }

  alarm_actions = [module.aws_sns_topic_1.sns_topic_arn]
}

module "all_lambdas_errors_alarm" {
  source = "../../modules/metric-alarm"

  alarm_name          = "all-lambdas-errors"
  alarm_description   = "Lambdas with errors"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  threshold           = 0
  period              = 60
  unit                = "Count"

  namespace   = "AWS/Lambda"
  metric_name = "Errors"
  statistic   = "Maximum"

  alarm_actions = [module.aws_sns_topic_1.sns_topic_arn]
}

module "suppressor" {
  source = "../../modules/metric-alarm"

  alarm_name          = "deployment-alarm"
  alarm_description   = "Deployment alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  threshold           = 1
  metric_query = [{
    id = "e1"

    return_data = true
    expression  = "TIME_SERIES(1)"
    label       = "deployment"
    period      = 60
  }]

  alarm_actions = [module.aws_sns_topic_1.sns_topic_arn]
}

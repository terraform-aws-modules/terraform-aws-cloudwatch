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

  alarm_actions = [module.aws_sns_topic.sns_topic_arn]
  ok_actions    = [module.aws_sns_topic.sns_topic_arn]

  alarm_rule = <<EOF
ALARM(${module.alarm.cloudwatch_metric_alarm_id})
EOF

  actions_suppresor = {
    alarm            = "suppressor"
    extension_period = 10
    wait_period      = 10
  }

  tags = local.tags
}

################################################################################
# Supporting Resources
################################################################################

module "aws_sns_topic" {
  source = "../fixtures/aws_sns_topic"
}

module "aws_lambda_function1" {
  source = "../fixtures/aws_lambda_function"
}

module "alarm" {
  source = "../../modules/metric-alarm"

  alarm_name          = "lambda-duration-${module.aws_lambda_function1.random_id}"
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

  alarm_actions = [module.aws_sns_topic.sns_topic_arn]
}

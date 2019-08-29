provider "aws" {
  region = "eu-west-1"
}

module "aws_lambda_function1" {
  source = "../fixtures/aws_lambda_function"
}

module "aws_lambda_function2" {
  source = "../fixtures/aws_lambda_function"
}

module "aws_sns_topic" {
  source = "../fixtures/aws_sns_topic"
}

module "alarms" {
  source = "../../modules/metric-alarms-by-multiple-dimensions"

  alarm_name          = "lambda-duration-"
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
    "lambda1" = {
      FunctionName = module.aws_lambda_function1.this_lambda_function_name
    },
    "lambda2" = {
      FunctionName = module.aws_lambda_function2.this_lambda_function_name
    },
  }

  alarm_actions = [module.aws_sns_topic.this_sns_topic_arn]
}

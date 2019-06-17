provider "aws" {
  region = "eu-west-1"
}

module "aws_lambda_function" {
  source = "../fixtures/aws_lambda_function"
}

module "aws_sns_topic" {
  source = "../fixtures/aws_sns_topic"
}

module "alarm" {
  source = "../../modules/metric-alarm"

  alarm_name          = "lambda-duration-${module.aws_lambda_function.random_id}"
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
    FunctionName = module.aws_lambda_function.this_lambda_function_name
  }

  alarm_actions = [module.aws_sns_topic.this_sns_topic_arn]
}

module "alarm_metric_query" {
  source = "../../modules/metric-alarm"

  alarm_name          = "mq-lambda-duration-${module.aws_lambda_function.random_id}"
  alarm_description   = "Lambda error rate is too high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  threshold           = 10

  metric_query = [{
    id = "e1"

    return_data = true
    expression  = "m2/m1*100"
    label       = "Error Rate"
    }, {
    id = "m1"

    metric = [{
      namespace   = "AWS/Lambda"
      metric_name = "Invocations"
      period      = 60
      stat        = "Sum"
      unit        = "Count"

      dimensions = {
        FunctionName = module.aws_lambda_function.this_lambda_function_name
      }
    }]
    }, {
    id = "m2"

    metric = [{
      namespace   = "AWS/Lambda"
      metric_name = "Errors"
      period      = 60
      stat        = "Sum"
      unit        = "Count"

      dimensions = {
        FunctionName = module.aws_lambda_function.this_lambda_function_name
      }
    }]
  }]

  alarm_actions = [module.aws_sns_topic.this_sns_topic_arn]

  tags = {
    Secure = "maybe"
  }
}

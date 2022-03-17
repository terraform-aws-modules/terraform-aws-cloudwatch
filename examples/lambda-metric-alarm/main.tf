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

# Alarm - "there is at least one error in a minute in AWS Lambda functions"
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

  alarm_actions = [module.aws_sns_topic.sns_topic_arn]
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

module "alarm_metric_query" {
  source = "../../modules/metric-alarm"

  alarm_name          = "mq-lambda-duration-${module.aws_lambda_function2.random_id}"
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
        FunctionName = module.aws_lambda_function2.lambda_function_name
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
        FunctionName = module.aws_lambda_function2.lambda_function_name
      }
    }]
  }]

  alarm_actions = [module.aws_sns_topic.sns_topic_arn]

  tags = {
    Secure = "maybe"
  }
}

module "alarm_anomaly" {
  source = "../../modules/metric-alarm"

  alarm_name          = "lambda-invocations-anomaly-${module.aws_lambda_function2.random_id}"
  alarm_description   = "Lambda invocations anomaly"
  comparison_operator = "LessThanLowerOrGreaterThanUpperThreshold"
  evaluation_periods  = 1
  threshold_metric_id = "ad1"

  metric_query = [{
    id = "ad1"

    return_data = true
    expression  = "ANOMALY_DETECTION_BAND(m1, 2)"
    label       = "Invocations (expected)"
    return_data = "true"
    },
    {
      id = "m1"

      metric = [{
        namespace   = "AWS/Lambda"
        metric_name = "Invocations"
        period      = 60
        stat        = "Sum"
        unit        = "Count"

        dimensions = {
          FunctionName = module.aws_lambda_function2.lambda_function_name
        }
      }]
      return_data = "true"
  }]

  alarm_actions = [module.aws_sns_topic.sns_topic_arn]

  tags = {
    Secure = "maybe"
  }
}

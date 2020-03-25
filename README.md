# AWS Cloudwatch Terraform module

Terraform module which creates Cloudwatch resources on AWS.

This type of resources are supported:

* [Log metric filter](https://www.terraform.io/docs/providers/aws/r/cloudwatch_log_metric_filter.html)
* [Metric alarm](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html)

## Terraform versions

Only Terraform 0.12 is supported.

## Usage

### Log metric filter

```hcl
module "log_metric_filter" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/log-metric-filter"
  version = "~> 1.0"

  log_group_name = "my-application-logs"

  name    = "error-metric"
  pattern = "ERROR"

  metric_transformation_namespace = "MyApplication"
  metric_transformation_name      = "ErrorCount"
}
```

Read [Filter and Pattern Syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html) for explanation of `pattern`.

### Metric alarm

```hcl
module "metric_alarm" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/metric-alarm"
  version = "~> 1.0"

  alarm_name          = "my-application-logs-errors"
  alarm_description   = "Bad errors in my-application-logs"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  threshold           = 10
  period              = 60
  unit                = "Count"

  namespace   = "MyApplication"
  metric_name = "ErrorCount"
  statistic   = "Maximum"

  alarm_actions = ["arn:aws:sns:eu-west-1:835367859852:my-sns-queue"]
}
```

### Metric alarms by multiple dimensions

This submodule is useful when you need to create very similar alarms where only dimensions are different (eg, multiple AWS Lambda functions), but the rest of arguments are the same.

```hcl
module "metric_alarms" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/metric-alarms-by-multiple-dimensions"
  version = "~> 1.0"

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
      FunctionName = "index"
    },
    "lambda2" = {
      FunctionName = "signup"
    },
  }

  alarm_actions = ["arn:aws:sns:eu-west-1:835367859852:my-sns-queue"]
}
```

Check out [list of all AWS services that publish CloudWatch metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html) for detailed information about each supported service.

### CIS AWS Foundations Controls: Metrics + Alarms
 
```hcl
module "cis_alarms" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/cis-alarms"
  version = "~> 1.0"

  log_group_name = "my-cloudtrail-logs"
  alarm_actions  = ["arn:aws:sns:eu-west-1:835367859852:my-sns-queue"]
}
```

AWS CloudTrail normally publishes logs into AWS CloudWatch Logs. This module creates log metric filters together with metric alarms according to [CIS AWS Foundations Benchmark v1.2.0](https://d1.awsstatic.com/whitepapers/compliance/AWS_CIS_Foundations_Benchmark.pdf). Read more about [CIS AWS Foundations Controls](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-cis-controls.html).

## Examples

* [Complete Cloudwatch log metric filter and alarm](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/tree/master/examples/complete-log-metric-filter-and-alarm)
* [Cloudwatch metric alarms for AWS Lambda](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/tree/master/examples/lambda-metric-alarm)
* [Cloudwatch metric alarms for AWS Lambda with multiple dimensions](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/tree/master/examples/metric-alarms-by-multiple-dimensions)
* [CIS AWS Foundations Controls: Metrics + Alarms](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/tree/master/examples/cis-alarms)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module managed by [Anton Babenko](https://github.com/antonbabenko).

The development of this module was sponsored by [indebted.co](https://www.indebted.co/?utm_source=terraform-aws-cloudwatch).

## License

Apache 2 Licensed. See LICENSE for full details.

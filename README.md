# AWS Cloudwatch Terraform module

Terraform module which creates Cloudwatch resources on AWS.

## Usage

### Log metric filter

```hcl
module "log_metric_filter" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/log-metric-filter"
  version = "~> 3.0"

  log_group_name = "my-application-logs"

  name    = "error-metric"
  pattern = "ERROR"

  metric_transformation_namespace = "MyApplication"
  metric_transformation_name      = "ErrorCount"
}
```

Read [Filter and Pattern Syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html) for explanation of `pattern`.

### Log group

```hcl
module "log_group" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/log-group"
  version = "~> 3.0"

  name              = "my-app"
  retention_in_days = 120
}
```

### Log stream

```hcl
module "log_stream" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/log-stream"
  version = "~> 3.0"

  name           = "stream1"
  log_group_name = "my-app"
}
```

### Metric alarm

```hcl
module "metric_alarm" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/metric-alarm"
  version = "~> 3.0"

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
  version = "~> 3.0"

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
  version = "~> 3.0"

  log_group_name = "my-cloudtrail-logs"
  alarm_actions  = ["arn:aws:sns:eu-west-1:835367859852:my-sns-queue"]
}
```

AWS CloudTrail normally publishes logs into AWS CloudWatch Logs. This module creates log metric filters together with metric alarms according to [CIS AWS Foundations Benchmark v1.4.0 (05-28-2021)](https://www.cisecurity.org/benchmark/amazon_web_services/). Read more about [CIS AWS Foundations Controls](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-cis-controls.html).

### Metric Stream

```hcl
module "metric_stream" {
  name          = "metric-stream"
  firehose_arn  = "arn:aws:firehose:eu-west-1:835367859852:deliverystream/metric-stream-example"
  output_format = "json"
  role_arn      = "arn:aws:iam::835367859852:role/metric-stream-to-firehose-20240113005123755300000002"

  # conflicts with exclude_filter
  include_filter = {
    ec2 = {
      namespace    = "AWS/EC2"
      metric_names = ["CPUUtilization", "NetworkIn"]
    }
  }

  statistics_configuration = [
    {
      additional_statistics = ["p99"]
      include_metric = [
        {
          namespace   = "AWS/EC2"
          metric_name = "CPUUtilization"
        },
        {
          namespace   = "AWS/EC2"
          metric_name = "NetworkIn"
        }
      ]
    },
    {
      additional_statistics = ["p90", "TM(10%:90%)"]
      include_metric = [
        {
          namespace   = "AWS/EC2"
          metric_name = "CPUUtilization"
        }
      ]
    }
  ]
}
```

### Query Definition

```hcl
module "query_definition" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/query-definition"
  version = "~> 4.0"

  name = "my-query-definition"
  log_group_names = ["my-log-group-name"]
  query_string = <<EOF
fields @timestamp, @message
| sort @timestamp desc
| limit 25
EOF
}
```

### Composite Alarm

```hcl
module "composite_alarm" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/composite-alarm"
  version = "~> 4.0"

  alarm_name        = "composite-alarm"
  alarm_description = "Example of a composite alarm"

  alarm_actions = ["arn:aws:sns:eu-west-1:835367859852:my-sns-topic"]
  ok_actions    = ["arn:aws:sns:eu-west-1:835367859852:my-sns-topic"]

  alarm_rule = join(" AND ", tolist([
    "ALARM(metric-alarm-1)",
    "ALARM(metric-alarm-2)"
  ]))

  actions_suppressor = {
    alarm            = "suppressor"
    extension_period = 20
    wait_period      = 10
  }
}
```

## Examples

- [Complete Cloudwatch log metric filter and alarm](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/tree/master/examples/complete-log-metric-filter-and-alarm)
- [Cloudwatch log group with log stream](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/tree/master/examples/log-group-with-log-stream)
- [Cloudwatch metric alarms for AWS Lambda](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/tree/master/examples/lambda-metric-alarm)
- [Cloudwatch metric alarms for AWS Lambda with multiple dimensions](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/tree/master/examples/multiple-lambda-metric-alarm)
- [CIS AWS Foundations Controls: Metrics + Alarms](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/tree/master/examples/cis-alarms)
- [Cloudwatch query definition](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/tree/master/examples/query-definition)
- [Cloudwatch Metric Stream](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/tree/master/examples/metric-stream)
- [Cloudwatch Composite Alarm](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/tree/master/examples/composite-alarm)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module is maintained by [Anton Babenko](https://github.com/antonbabenko) with help from [these awesome contributors](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/graphs/contributors).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/tree/master/LICENSE) for full details.

# metric-alarm

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| actions\_enabled | Indicates whether or not actions should be executed during any changes to the alarm's state. Defaults to true. | `bool` | `true` | no |
| alarm\_actions | The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN). | `list(string)` | n/a | yes |
| alarm\_description | The description for the alarm. | `string` | n/a | yes |
| alarm\_name | The descriptive name for the alarm. This name must be unique within the user's AWS account. | `string` | n/a | yes |
| comparison\_operator | The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand. Either of the following is supported: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold. | `string` | n/a | yes |
| create\_metric\_alarm | Whether to create the Cloudwatch metric alarm | `bool` | `true` | no |
| datapoints\_to\_alarm | The number of datapoints that must be breaching to trigger the alarm. | `number` | n/a | yes |
| dimensions | The dimensions for the alarm's associated metric. | `any` | n/a | yes |
| evaluate\_low\_sample\_count\_percentiles | Used only for alarms based on percentiles. If you specify ignore, the alarm state will not change during periods with too few data points to be statistically significant. If you specify evaluate or omit this parameter, the alarm will always be evaluated and possibly change state no matter how many data points are available. The following values are supported: ignore, and evaluate. | `string` | n/a | yes |
| evaluation\_periods | The number of periods over which data is compared to the specified threshold. | `number` | n/a | yes |
| extended\_statistic | The percentile statistic for the metric associated with the alarm. Specify a value between p0.0 and p100. | `string` | n/a | yes |
| insufficient\_data\_actions | The list of actions to execute when this alarm transitions into an INSUFFICIENT\_DATA state from any other state. Each action is specified as an Amazon Resource Name (ARN). | `list(string)` | n/a | yes |
| metric\_name | The name for the alarm's associated metric. See docs for supported metrics. | `string` | n/a | yes |
| metric\_query | Enables you to create an alarm based on a metric math expression. You may specify at most 20. | `any` | `[]` | no |
| namespace | The namespace for the alarm's associated metric. See docs for the list of namespaces. See docs for supported metrics. | `string` | n/a | yes |
| ok\_actions | The list of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Name (ARN). | `list(string)` | n/a | yes |
| period | The period in seconds over which the specified statistic is applied. | `string` | n/a | yes |
| statistic | The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum | `string` | n/a | yes |
| tags | A mapping of tags to assign to all resources | `map(string)` | `{}` | no |
| threshold | The value against which the specified statistic is compared. | `number` | n/a | yes |
| treat\_missing\_data | Sets how this alarm is to handle missing data points. The following values are supported: missing, ignore, breaching and notBreaching. | `string` | `"missing"` | no |
| unit | The unit for the alarm's associated metric. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| this\_cloudwatch\_metric\_alarm\_arn | The ARN of the Cloudwatch metric alarm. |
| this\_cloudwatch\_metric\_alarm\_id | The ID of the Cloudwatch metric alarm. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

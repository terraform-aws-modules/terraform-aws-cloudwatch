# log-metric-filter

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create\_cloudwatch\_log\_metric\_filter | Whether to create the Cloudwatch log metric filter | `bool` | `true` | no |
| log\_group\_name | The name of the log group to associate the metric filter with | `string` | n/a | yes |
| metric\_transformation\_default\_value | The value to emit when a filter pattern does not match a log event. | `string` | `null` | no |
| metric\_transformation\_name | The name of the CloudWatch metric to which the monitored log information should be published (e.g. ErrorCount) | `string` | n/a | yes |
| metric\_transformation\_namespace | The destination namespace of the CloudWatch metric. | `string` | n/a | yes |
| metric\_transformation\_value | What to publish to the metric. For example, if you're counting the occurrences of a particular term like 'Error', the value will be '1' for each occurrence. If you're counting the bytes transferred the published value will be the value in the log event. | `string` | `"1"` | no |
| name | A name for the metric filter. | `string` | n/a | yes |
| pattern | A valid CloudWatch Logs filter pattern for extracting metric data out of ingested log events. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| this\_cloudwatch\_log\_metric\_filter\_id | The name of the metric filter |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

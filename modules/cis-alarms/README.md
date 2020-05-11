# CIS AWS Foundations Controls

Read more about [CIS AWS Foundations Controls](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-cis-controls.html) and stay secure.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| actions\_enabled | Indicates whether or not actions should be executed during any changes to the alarm's state. | `bool` | `true` | no |
| alarm\_actions | List of ARNs to put as Cloudwatch Alarms actions (eg, ARN of SNS topic) | `list(string)` | `[]` | no |
| create | Whether to create the Cloudwatch log metric filter and metric alarms | `bool` | `true` | no |
| disabled\_controls | List of IDs of disabled CIS controls | `list(string)` | `[]` | no |
| log\_group\_name | The name of the log group to associate the metric filter with | `string` | `""` | no |
| namespace | The namespace where metric filter and metric alarm should be cleated | `string` | `"CISBenchmark"` | no |
| tags | A mapping of tags to assign to all resources | `map(string)` | `{}` | no |
| use\_random\_name\_prefix | Whether to prefix resource names with random prefix | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| this\_cloudwatch\_metric\_alarm\_arns | List of ARNs of the Cloudwatch metric alarm |
| this\_cloudwatch\_metric\_alarm\_ids | List of IDs of the Cloudwatch metric alarm |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

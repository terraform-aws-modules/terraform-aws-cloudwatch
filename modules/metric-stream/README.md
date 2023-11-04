# metric-stream

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_stream.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_stream) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input\_create) | Whether to create the Cloudwatch metric stream. | `bool` | `true` | no |
| <a name="input_exclude_filter"></a> [exclude\_filter](#input\_exclude\_filter) | Map of exclusive metric filters. If you specify this parameter, the stream sends metrics from all metric namespaces except for the namespaces and the conditional metric names that you specify here. If you don't specify metric names or provide empty metric names whole metric namespace is excluded. Conflicts with include\_filter. | `any` | `{}` | no |
| <a name="input_firehose_arn"></a> [firehose\_arn](#input\_firehose\_arn) | ARN of the Amazon Kinesis Firehose delivery stream to use for this metric stream. | `string` | n/a | yes |
| <a name="input_include_filter"></a> [include\_filter](#input\_include\_filter) | Map of inclusive metric filters. If you specify this parameter, the stream sends only the conditional metric names from the metric namespaces that you specify here. If you don't specify metric names or provide empty metric names whole metric namespace is included. Conflicts with exclude\_filter. | `any` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Friendly name of the metric stream. If omitted, Terraform will assign a random, unique name. Conflicts with name\_prefix. | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Creates a unique friendly name beginning with the specified prefix. Conflicts with name. | `string` | `null` | no |
| <a name="input_output_format"></a> [output\_format](#input\_output\_format) | Output format for the stream. Possible values are json and opentelemetry0.7. | `string` | n/a | yes |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | ARN of the IAM role that this metric stream will use to access Amazon Kinesis Firehose resources. | `string` | n/a | yes |
| <a name="input_statistics_configuration"></a> [statistics\_configuration](#input\_statistics\_configuration) | Map of statistics configuration. | `any` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to the Cloudwatch Metric Stream. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_metric_stream"></a> [cloudwatch\_metric\_stream](#output\_cloudwatch\_metric\_stream) | ARN of the metric stream. |
| <a name="output_cloudwatch_metric_stream_creation_date"></a> [cloudwatch\_metric\_stream\_creation\_date](#output\_cloudwatch\_metric\_stream\_creation\_date) | Date and time in RFC3339 format that the metric stream was created. |
| <a name="output_cloudwatch_metric_stream_last_update_date"></a> [cloudwatch\_metric\_stream\_last\_update\_date](#output\_cloudwatch\_metric\_stream\_last\_update\_date) | Date and time in RFC3339 format that the metric stream was last updated. |
| <a name="output_cloudwatch_metric_stream_state"></a> [cloudwatch\_metric\_stream\_state](#output\_cloudwatch\_metric\_stream\_state) | State of the metric stream. Possible values are running and stopped. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

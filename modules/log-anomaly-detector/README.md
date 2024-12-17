# log-anomaly-detector

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.81 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.81 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_anomaly_detector.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_anomaly_detector) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_anomaly_visibility_time"></a> [anomaly\_visibility\_time](#input\_anomaly\_visibility\_time) | Number of days to have visibility on an anomaly. After this time period has elapsed for an anomaly, it will be automatically baselined and the anomaly detector will treat new occurrences of a similar anomaly as normal. Therefore, if you do not correct the cause of an anomaly during the time period specified in anomaly\_visibility\_time, it will be considered normal going forward and will not be detected as an anomaly. Valid Range: Minimum value of 7. Maximum value of 90. | `number` | `null` | no |
| <a name="input_create"></a> [create](#input\_create) | Whether to create the anomaly detector. | `bool` | `true` | no |
| <a name="input_detector_name"></a> [detector\_name](#input\_detector\_name) | Name for this anomaly detector. | `string` | `null` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether or not to enable the anomaly detector. | `bool` | `null` | no |
| <a name="input_evaluation_frequency"></a> [evaluation\_frequency](#input\_evaluation\_frequency) | Specifies how often the anomaly detector is to run and look for anomalies. Set this value according to the frequency that the log group receives new logs. For example, if the log group receives new log events every 10 minutes, then 15 minutes might be a good setting for evaluation\_frequency. Valid Values: ONE\_MIN \| FIVE\_MIN \| TEN\_MIN \| FIFTEEN\_MIN \| THIRTY\_MIN \| ONE\_HOUR. | `string` | `null` | no |
| <a name="input_filter_pattern"></a> [filter\_pattern](#input\_filter\_pattern) | You can use this parameter to limit the anomaly detection model to examine only log events that match the pattern you specify here. | `string` | `null` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | Optionally assigns a AWS KMS key to secure this anomaly detector and its findings. If a key is assigned, the anomalies found and the model used by this detector are encrypted at rest with the key. If a key is assigned to an anomaly detector, a user must have permissions for both this key and for the anomaly detector to retrieve information about the anomalies that it finds. | `string` | `null` | no |
| <a name="input_log_group_arns"></a> [log\_group\_arns](#input\_log\_group\_arns) | Array containing the ARN of the log group that this anomaly detector will watch. You can specify only one log group ARN. | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the anomaly detector. |
<!-- END_TF_DOCS -->

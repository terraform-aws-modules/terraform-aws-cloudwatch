# Complete Cloudwatch log metric filter and alarm

Configuration in this directory creates Cloudwatch log metric (based on pattern "ERROR") and connects it to Cloudwatch alarm which will push to SNS topic.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.55 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alarm"></a> [alarm](#module\_alarm) | ../../modules/metric-alarm | n/a |
| <a name="module_aws_sns_topic"></a> [aws\_sns\_topic](#module\_aws\_sns\_topic) | ../fixtures/aws_sns_topic | n/a |
| <a name="module_log_group"></a> [log\_group](#module\_log\_group) | ../../modules/log-group | n/a |
| <a name="module_log_metric_filter"></a> [log\_metric\_filter](#module\_log\_metric\_filter) | ../../modules/log-metric-filter | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_log_group_arn"></a> [cloudwatch\_log\_group\_arn](#output\_cloudwatch\_log\_group\_arn) | ARN of Cloudwatch log group |
| <a name="output_cloudwatch_log_group_name"></a> [cloudwatch\_log\_group\_name](#output\_cloudwatch\_log\_group\_name) | Name of Cloudwatch log group |
| <a name="output_cloudwatch_log_metric_filter_id"></a> [cloudwatch\_log\_metric\_filter\_id](#output\_cloudwatch\_log\_metric\_filter\_id) | The name of the metric filter |
| <a name="output_cloudwatch_metric_alarm_arn"></a> [cloudwatch\_metric\_alarm\_arn](#output\_cloudwatch\_metric\_alarm\_arn) | The ARN of the Cloudwatch metric alarm |
| <a name="output_cloudwatch_metric_alarm_id"></a> [cloudwatch\_metric\_alarm\_id](#output\_cloudwatch\_metric\_alarm\_id) | The ID of the Cloudwatch metric alarm |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

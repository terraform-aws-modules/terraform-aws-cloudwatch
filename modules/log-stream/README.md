# log-stream

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.55 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.55 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_stream.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_stream) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input\_create) | Whether to create the Cloudwatch log stream | `bool` | `true` | no |
| <a name="input_log_group_name"></a> [log\_group\_name](#input\_log\_group\_name) | A name of the log group | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | A name for the log stream | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_log_stream_arn"></a> [cloudwatch\_log\_stream\_arn](#output\_cloudwatch\_log\_stream\_arn) | ARN of Cloudwatch log stream |
| <a name="output_cloudwatch_log_stream_name"></a> [cloudwatch\_log\_stream\_name](#output\_cloudwatch\_log\_stream\_name) | Name of Cloudwatch log stream |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

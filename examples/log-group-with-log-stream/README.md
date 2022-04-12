# Complete Cloudwatch log group and log stream

Configuration in this directory creates Cloudwatch log group with log stream

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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.55 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_log_group"></a> [log\_group](#module\_log\_group) | ../../modules/log-group | n/a |
| <a name="module_log_group_wrapped"></a> [log\_group\_wrapped](#module\_log\_group\_wrapped) | ../../wrappers/log-group | n/a |
| <a name="module_log_stream"></a> [log\_stream](#module\_log\_stream) | ../../modules/log-stream | n/a |
| <a name="module_log_stream_wrapped"></a> [log\_stream\_wrapped](#module\_log\_stream\_wrapped) | ../../wrappers/log-stream | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_log_group_arn"></a> [cloudwatch\_log\_group\_arn](#output\_cloudwatch\_log\_group\_arn) | ARN of Cloudwatch log group |
| <a name="output_cloudwatch_log_group_name"></a> [cloudwatch\_log\_group\_name](#output\_cloudwatch\_log\_group\_name) | Name of Cloudwatch log group |
| <a name="output_cloudwatch_log_stream_arn"></a> [cloudwatch\_log\_stream\_arn](#output\_cloudwatch\_log\_stream\_arn) | ARN of Cloudwatch log stream |
| <a name="output_cloudwatch_log_stream_name"></a> [cloudwatch\_log\_stream\_name](#output\_cloudwatch\_log\_stream\_name) | Name of Cloudwatch log stream |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# Cloudwatch log group example

Creates a Cloudwatch log group granting access to ElasticSearch.

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

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.55 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_advanced_example"></a> [advanced\_example](#module\_advanced\_example) | ../../modules/log-group | n/a |
| <a name="module_basic_example"></a> [basic\_example](#module\_basic\_example) | ../../modules/log-group | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.custom](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_advanced_example_cloudwatch_log_group_arn"></a> [advanced\_example\_cloudwatch\_log\_group\_arn](#output\_advanced\_example\_cloudwatch\_log\_group\_arn) | ARN of Cloudwatch log group |
| <a name="output_advanced_example_cloudwatch_log_group_name"></a> [advanced\_example\_cloudwatch\_log\_group\_name](#output\_advanced\_example\_cloudwatch\_log\_group\_name) | Name of Cloudwatch log group |
| <a name="output_advanced_example_cloudwatch_log_group_resource_policies"></a> [advanced\_example\_cloudwatch\_log\_group\_resource\_policies](#output\_advanced\_example\_cloudwatch\_log\_group\_resource\_policies) | IDs of Cloudwatch Resource Policies |
| <a name="output_basic_example_cloudwatch_log_group_arn"></a> [basic\_example\_cloudwatch\_log\_group\_arn](#output\_basic\_example\_cloudwatch\_log\_group\_arn) | ARN of Cloudwatch log group |
| <a name="output_basic_example_cloudwatch_log_group_name"></a> [basic\_example\_cloudwatch\_log\_group\_name](#output\_basic\_example\_cloudwatch\_log\_group\_name) | Name of Cloudwatch log group |
| <a name="output_basic_example_cloudwatch_log_group_resource_policies"></a> [basic\_example\_cloudwatch\_log\_group\_resource\_policies](#output\_basic\_example\_cloudwatch\_log\_group\_resource\_policies) | IDs of Cloudwatch Resource Policies |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

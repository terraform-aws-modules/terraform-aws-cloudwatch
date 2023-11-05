# query-definition

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_query_definition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_query_definition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input\_create) | Whether to create the Cloudwatch query definition | `bool` | `true` | no |
| <a name="input_log_group_names"></a> [log\_group\_names](#input\_log\_group\_names) | Specific log groups to use with the query. | `list(string)` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the query. | `string` | n/a | yes |
| <a name="input_query_string"></a> [query\_string](#input\_query\_string) | The The query to save. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_query_definition_id"></a> [query\_definition\_id](#output\_query\_definition\_id) | The query definition id. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

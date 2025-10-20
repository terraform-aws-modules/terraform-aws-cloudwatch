# Cloudwatch Metric Stream

Configuration in this directory creates Cloudwatch metric streams and delivers them to Kinesis Firehose with an s3 destination.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_firehose_to_s3_iam_role"></a> [firehose\_to\_s3\_iam\_role](#module\_firehose\_to\_s3\_iam\_role) | terraform-aws-modules/iam/aws//modules/iam-role | ~> 6.0 |
| <a name="module_metrics_bucket"></a> [metrics\_bucket](#module\_metrics\_bucket) | terraform-aws-modules/s3-bucket/aws | ~> 5.0 |
| <a name="module_stream_all"></a> [stream\_all](#module\_stream\_all) | ../../modules/metric-stream | n/a |
| <a name="module_stream_all_disabled"></a> [stream\_all\_disabled](#module\_stream\_all\_disabled) | ../../modules/metric-stream | n/a |
| <a name="module_stream_to_firehose_iam_role"></a> [stream\_to\_firehose\_iam\_role](#module\_stream\_to\_firehose\_iam\_role) | terraform-aws-modules/iam/aws//modules/iam-role | ~> 6.0 |
| <a name="module_stream_with_exclude_filter"></a> [stream\_with\_exclude\_filter](#module\_stream\_with\_exclude\_filter) | ../../modules/metric-stream | n/a |
| <a name="module_stream_with_include_filter"></a> [stream\_with\_include\_filter](#module\_stream\_with\_include\_filter) | ../../modules/metric-stream | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_kinesis_firehose_delivery_stream.s3_all_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [aws_kinesis_firehose_delivery_stream.s3_exclude_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [aws_kinesis_firehose_delivery_stream.s3_include_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_all_example_metric_stream"></a> [all\_example\_metric\_stream](#output\_all\_example\_metric\_stream) | ARN of the metric stream. |
| <a name="output_all_example_metric_stream_creation_date"></a> [all\_example\_metric\_stream\_creation\_date](#output\_all\_example\_metric\_stream\_creation\_date) | Date and time in RFC3339 format that the metric stream was created. |
| <a name="output_all_example_metric_stream_last_update_date"></a> [all\_example\_metric\_stream\_last\_update\_date](#output\_all\_example\_metric\_stream\_last\_update\_date) | Date and time in RFC3339 format that the metric stream was last updated. |
| <a name="output_all_example_metric_stream_state"></a> [all\_example\_metric\_stream\_state](#output\_all\_example\_metric\_stream\_state) | State of the metric stream. Possible values are running and stopped. |
| <a name="output_exclude_example_metric_stream"></a> [exclude\_example\_metric\_stream](#output\_exclude\_example\_metric\_stream) | ARN of the metric stream. |
| <a name="output_exclude_example_metric_stream_creation_date"></a> [exclude\_example\_metric\_stream\_creation\_date](#output\_exclude\_example\_metric\_stream\_creation\_date) | Date and time in RFC3339 format that the metric stream was created. |
| <a name="output_exclude_example_metric_stream_last_update_date"></a> [exclude\_example\_metric\_stream\_last\_update\_date](#output\_exclude\_example\_metric\_stream\_last\_update\_date) | Date and time in RFC3339 format that the metric stream was last updated. |
| <a name="output_exclude_example_metric_stream_state"></a> [exclude\_example\_metric\_stream\_state](#output\_exclude\_example\_metric\_stream\_state) | State of the metric stream. Possible values are running and stopped. |
| <a name="output_include_example_metric_stream"></a> [include\_example\_metric\_stream](#output\_include\_example\_metric\_stream) | ARN of the metric stream. |
| <a name="output_include_example_metric_stream_creation_date"></a> [include\_example\_metric\_stream\_creation\_date](#output\_include\_example\_metric\_stream\_creation\_date) | Date and time in RFC3339 format that the metric stream was created. |
| <a name="output_include_example_metric_stream_last_update_date"></a> [include\_example\_metric\_stream\_last\_update\_date](#output\_include\_example\_metric\_stream\_last\_update\_date) | Date and time in RFC3339 format that the metric stream was last updated. |
| <a name="output_include_example_metric_stream_state"></a> [include\_example\_metric\_stream\_state](#output\_include\_example\_metric\_stream\_state) | State of the metric stream. Possible values are running and stopped. |
<!-- END_TF_DOCS -->

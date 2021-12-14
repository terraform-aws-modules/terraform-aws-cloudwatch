# Cloudwatch metric alarms for AWS Lambda example

Configuration in this directory creates Cloudwatch metric alarms for AWS Lambda. One metric alarm is based on `metric_name` defined by AWS Lambda service, another metric alarm is based on `metric_query` which monitors error rates (number of errors divided by the number of invocations).

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
| <a name="module_alarm_metric_query"></a> [alarm\_metric\_query](#module\_alarm\_metric\_query) | ../../modules/metric-alarm | n/a |
| <a name="module_all_lambdas_errors_alarm"></a> [all\_lambdas\_errors\_alarm](#module\_all\_lambdas\_errors\_alarm) | ../../modules/metric-alarm | n/a |
| <a name="module_aws_lambda_function1"></a> [aws\_lambda\_function1](#module\_aws\_lambda\_function1) | ../fixtures/aws_lambda_function | n/a |
| <a name="module_aws_lambda_function2"></a> [aws\_lambda\_function2](#module\_aws\_lambda\_function2) | ../fixtures/aws_lambda_function | n/a |
| <a name="module_aws_sns_topic"></a> [aws\_sns\_topic](#module\_aws\_sns\_topic) | ../fixtures/aws_sns_topic | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_metric_alarm_arn"></a> [cloudwatch\_metric\_alarm\_arn](#output\_cloudwatch\_metric\_alarm\_arn) | The ARN of the Cloudwatch metric alarm |
| <a name="output_cloudwatch_metric_alarm_id"></a> [cloudwatch\_metric\_alarm\_id](#output\_cloudwatch\_metric\_alarm\_id) | The ID of the Cloudwatch metric alarm |
| <a name="output_lambda_function1_arn"></a> [lambda\_function1\_arn](#output\_lambda\_function1\_arn) | Lambda function ARN |
| <a name="output_lambda_function1_name"></a> [lambda\_function1\_name](#output\_lambda\_function1\_name) | Lambda function name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

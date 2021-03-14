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
| terraform | >= 0.12.26 |
| aws | >= 2.55 |

## Providers

No provider.

## Modules

| Name | Source | Version |
|------|--------|---------|
| alarm | ../../modules/metric-alarm |  |
| alarm_metric_query | ../../modules/metric-alarm |  |
| all_lambdas_errors_alarm | ../../modules/metric-alarm |  |
| aws_lambda_function1 | ../fixtures/aws_lambda_function |  |
| aws_lambda_function2 | ../fixtures/aws_lambda_function |  |
| aws_sns_topic | ../fixtures/aws_sns_topic |  |

## Resources

No resources.

## Inputs

No input.

## Outputs

| Name | Description |
|------|-------------|
| this\_cloudwatch\_metric\_alarm\_arn | The ARN of the Cloudwatch metric alarm |
| this\_cloudwatch\_metric\_alarm\_id | The ID of the Cloudwatch metric alarm |
| this\_lambda\_function1\_arn | Lambda function ARN |
| this\_lambda\_function1\_name | Lambda function name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

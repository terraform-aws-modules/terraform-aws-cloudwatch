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

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

variable "create" {
  description = "Whether to create the Cloudwatch log group"
  type        = bool
  default     = true
}

variable "name" {
  description = "A name for the log group"
  type        = string
  default     = null
}

variable "name_prefix" {
  description = "A name prefix for the log group"
  type        = string
  default     = null
}

variable "retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group"
  type        = number
  default     = null
}

variable "kms_key_id" {
  description = "The ARN of the KMS Key to use when encrypting logs"
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to add to Cloudwatch log group"
  type        = map(string)
  default     = {}
}

variable "resource_policies" {
  description = "The resource policies to attach to the Cloudwatch log group mapped name to document"
  type        = map(string)
  default     = {}
}

variable "allowed_service_ids" {
  description = "The IDs of AWS services that should be allowed to publish logs to this log-group.  Names should be the identifier for the AWS service principal minus the `.amazonaws.com`. For example, elasticsearch would be `es`.  Each service will become one of the resource policies attached and will recieve a policy name equal to the service identifier"
  type        = set(string)
  default     = []
}

variable "allowed_service_actions" {
  description = "The IAM actions to allow each service to perform"
  type        = list(string)
  default = [
    "logs:CreateLogStream",
    "logs:PutLogEvents",
    "logs:PutLogEventsBatch",
  ]
}

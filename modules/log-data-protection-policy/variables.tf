variable "create" {
  description = "Whether to create the cloudwatch log data protection policy."
  type        = bool
  default     = true
}

variable "log_group_name" {
  description = "The name of the log group under which the log stream is to be created."
  type        = string
  default     = null
}

variable "policy_document" {
  description = "Specifies the data protection policy in JSON."
  type        = string
  default     = null
}

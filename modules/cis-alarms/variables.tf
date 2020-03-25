variable "create" {
  description = "Whether to create the Cloudwatch log metric filter and metric alarms"
  type        = bool
  default     = true
}

variable "use_random_name_prefix" {
  description = "Whether to prefix resource names with random prefix"
  type        = bool
  default     = false
}

variable "disabled_controls" {
  description = "List of IDs of disabled CIS controls"
  type        = list(string)
  default     = []
}

variable "namespace" {
  description = "The namespace where metric filter and metric alarm should be cleated"
  type        = string
  default     = "CISBenchmark"
}

variable "log_group_name" {
  description = "The name of the log group to associate the metric filter with"
  type        = string
  default     = ""
}

variable "alarm_actions" {
  description = "List of ARNs to put as Cloudwatch Alarms actions (eg, ARN of SNS topic)"
  type        = list(string)
  default     = []
}

variable "actions_enabled" {
  description = "Indicates whether or not actions should be executed during any changes to the alarm's state."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default     = {}
}

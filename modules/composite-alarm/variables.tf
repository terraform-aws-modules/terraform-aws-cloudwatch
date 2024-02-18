variable "create" {
  description = "Whether to create the Cloudwatch composite alarm"
  type        = bool
  default     = true
}

variable "alarm_name" {
  description = "The descriptive name for the composite alarm. This name must be unique within the region."
  type        = string
  default     = null
}

variable "alarm_description" {
  description = "The description for the composite alarm."
  type        = string
  default     = null
}

variable "actions_enabled" {
  description = "Indicates whether or not actions should be executed during any changes to the composite alarm's state. Defaults to true."
  type        = bool
  default     = true
}

variable "actions_suppressor" {
  description = "A map of actions suppressor alarm configurations."
  type        = map(any)
  default     = {}
}

variable "alarm_actions" {
  description = "The set of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN). Up to 5 actions are allowed."
  type        = list(string)
  default     = null
}

variable "insufficient_data_actions" {
  description = "The set of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state. Each action is specified as an Amazon Resource Name (ARN). Up to 5 actions are allowed."
  type        = list(string)
  default     = null
}

variable "ok_actions" {
  description = "The set of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Name (ARN). Up to 5 actions are allowed."
  type        = list(string)
  default     = null
}

variable "alarm_rule" {
  description = "An expression that specifies which other alarms are to be evaluated to determine this composite alarm's state. The maximum length is 10240 characters."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default     = {}
}

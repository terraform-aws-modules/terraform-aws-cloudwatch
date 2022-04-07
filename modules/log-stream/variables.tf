variable "create" {
  description = "Whether to create the Cloudwatch log stream"
  type        = bool
  default     = true
}

variable "name" {
  description = "A name for the log stream"
  type        = string
  default     = null
}

variable "log_group_name" {
  description = "A name of the log group"
  type        = string
  default     = null
}

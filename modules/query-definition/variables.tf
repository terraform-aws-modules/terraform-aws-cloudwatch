variable "create" {
  description = "Whether to create the Cloudwatch query definition"
  type        = bool
  default     = true
}

variable "name" {
  description = "The name of the query."
  type        = string
}

variable "query_string" {
  description = "The The query to save."
  type        = string
}

variable "log_group_names" {
  description = "Specific log groups to use with the query."
  type        = list(string)
  default     = null
}

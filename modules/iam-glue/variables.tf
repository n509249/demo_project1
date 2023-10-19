######################################
###       IAM Role & Policies      ###
######################################
variable iam_role_name {
  type        = string
  description = "IAM Role Name to be created"
}

variable iam_policy_name {
  type        = string
  description = "IAM Inline Policy to be created attaching to role"
}

variable s3buckets_read_permission {
  type        = list(string)
  description = "List of S3 Buckets require read permission"
  default     = []
}

variable s3buckets_write_permission {
  type        = list(string)
  description = "List of S3 Buckets require write permission"
  default     = []
}

variable s3buckets_delete_permission {
  type        = list(string)
  description = "List of S3 Buckets require delete permission"
  default     = []
}

variable secrets_manager_permission {
  type        = list(string)
  description = "Secret Manager get secret value permissions"
  default     = []
}

variable database_permission {
  type        = list(string)
  description = "list of database permission"
  default     = []
}

variable lambda_function_permission {
  type    = list(string)
  default = []
}

variable lambda_function_alias {
  type    = string
  default = ""
}

variable tags {
  type    = map(string)
  default = {}
}

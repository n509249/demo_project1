variable crawler_name {
  type    = string
  default = ""
}

variable iam_glue_role {
  type        = string
  default     = ""
}

variable classifiers {
  type    = list(string)
  default = []
}

variable crawler_scheduler {
  type    = string
  default = ""
}

variable glue_database_name {
  type    = string
  default = ""
}

variable recrawl_policy {
  type    = string
  default = ""
}

variable s3_target_bucket {
  type        = string
  default     = ""
}

variable sample_size {
  type        = number
  default     = 1
}

variable tags {
  type    = map(string)
  default = {}
}
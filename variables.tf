variable glue_database_name {
  type    = string
  default = ""
}

######################################
###        IAM Glue Variables      ###
######################################

variable iam_glue_roles {
  type    = list(object({ iam_role = string, iam_policy = string, s3buckets_read_permission = list(string), s3buckets_write_permission = list(string), s3buckets_delete_permission = list(string), secrets_manager_permission = string, lambda_function_permission = string, lambda_function_alias = string, database_permission = list(string), tags = map(string) }))
  default = []
}


######################################
###      Crawlers Variables      ###
######################################
variable crawlers {
  type = list(object({
    crawler_name = string,
    iam_glue_role = string,
    classifiers = list(string),
    crawler_scheduler = string,
    glue_database_name = string,
    recrawl_policy = string,
    s3_target_bucket = string,
    sample_size = number,
    tags = map(string)
  }))
  default = []
}


######################################
###        athena Variables        ###
######################################

variable "athena_workgroup" {
  type = string
}

/*variable "source_s3" {
  type = string
}*/
variable "athena_state" {
  type = string
}

variable "s3_output_location" {
  type = string
}



variable database_permission {
  type        = list(string)
  description = "list of database permission"
  default     = []
}

variable "alias_name" {
  description = "Alias name of lambda function"
  type        = string
  default     = ""
}

######################################
###        Common Variables        ###
######################################
variable tags {
  type    = map(string)
  default = {}
}

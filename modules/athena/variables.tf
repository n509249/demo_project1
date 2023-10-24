variable "athena_workgroup" {
  type = string
}
/*variable "athena_db_name" {
  type = string
}*/
/*variable "source_s3" {
  type = string
}*/
variable "athena_state" {
  type = string
}

variable "s3_output_location" {
  type = string
}

variable "alias_name" {
  type = string
}

variable glue_database_name {
  type    = string
  default = ""
}
######################################
###       Lambda Variables         ###
######################################
variable "function_name" {
  description = "Name of the lambda function"
  type        = string
  default     = ""
}

variable "function_filename" {
  description = "Path to the function's deployment package"
  type        = string
  default     = ""
}

variable "handler" {
  description = "Function entrypoint of the code"
  type        = string
  default     = ""
}

variable "function_runtime" {
  description = "Identifier of the function's runtime"
  type        = string
  default     = ""
}

variable "lambda_memory_size" {
  description = "Amount of memory in MB for the Lambda Function can use at runtime. Defaults to 128"
  type        = number
}

variable "timeout" {
  description = "Amount of time Lambda Function has to run in seconds. Defaults to 3"
  type        = number
}

variable "alias_name" {
  description = "Alias name of lambda function"
  type        = string
  default     = ""
}

variable "env_variables" {
  description = "Map of environment variables that are accessible from the function code during execution"
  type        = map(string)
  default     = {}
}

variable "layers" {
  description = "Name of the lambda layers in list"
  type        = list(string)
  default     = []
}

variable "prov_concurrent_execution" {
  description = "Amount of capacity to allocate"
  type        = number
  default     = 0
}

variable "lambda_tags" {
  description = "A map of tags to assign to the function"
  type        = map(string)
  default     = {}
}


######################################
###     DynamoDB Variables         ###
######################################
variable "dynamodb" {
  type = list(object({
    table_name     = string,
    hash_key       = string,
    hash_key_type  = string,
    range_key      = string,
    range_key_type = string,
    ttl_attribute  = string,
    table_tags     = map(string)
  }))
  default = []
}


######################################
###         S3 Variables           ###
######################################
variable s3 {
  type = list(object({
    bucket_name        = string,
    versioning_enabled = bool,
    encryption_enabled = bool,
    lifecycle_rules = list(object({
      rule_name                          = string,
      enabled                            = bool,
      expiration_days                    = number,
      noncurrent_version_expiration_days = number
    })),
    bucket_policy = object({
      iam_role_list_permission   = list(string),
      iam_role_read_permission   = list(string),
      iam_role_write_permission  = list(string),
      iam_role_delete_permission = list(string),
      iam_user_list_permission   = list(string),
      iam_user_read_permission   = list(string),
      iam_user_write_permission  = list(string),
      iam_user_delete_permission = list(string),
      read_prefix                = list(string),
      write_prefix               = list(string),
      delete_prefix              = list(string)
    }),
    s3_tags = map(string)
  }))
}

######################################
###          S3 Examples           ###
######################################
/*s3 = [
  { //Bucket to expire current version of objects
    bucket_name        = "poc-payment-details-data-generation-1"
    versioning_enabled = true
    encryption_enabled = true
    lifecycle_rules = [
      {
        rule_name = "expireCurrentVersionObject-rule"
        enabled   = true
        // Expire current versions of objects
        expiration_days                    = 15
        noncurrent_version_expiration_days = 0
      },
	  {
        rule_name = "deletePreviousVersionObject-rule"
        enabled   = true
        // Expire current versions of objects
        expiration_days                    = 0
        noncurrent_version_expiration_days = 30
      }
    ]
    bucket_policy = {
    iam_role_list_permission   = ["poc-cust360-events-pymnt_dtl_valdn_data-RoleForLambda"]
    iam_role_read_permission   = ["poc-cust360-events-pymnt_dtl_valdn_data-RoleForLambda"]
    iam_role_write_permission  = ["poc-cust360-events-pymnt_dtl_valdn_data-RoleForLambda"]
    iam_role_delete_permission = []
    read_prefix                = []
    write_prefix               = []
    delete_prefix              = []
  }
	s3_tags = {}
  },
  { //Bucket to permanently delete previous versions of objects
    bucket_name        = "poc-payment-details-data-generation-2"
    versioning_enabled = true
    encryption_enabled = true
    lifecycle_rules = [
      {
        rule_name       = "deletePreviousVersionObject-rule"
        enabled         = true
        expiration_days = 0
        //permanently delete previous versions of objects
        noncurrent_version_expiration_days = 15
      }
    ]
  bucket_policy = {
    iam_role_list_permission   = ["poc-cust360-events-pymnt_dtl_valdn_data-RoleForLambda"]
    iam_role_read_permission   = ["poc-cust360-events-pymnt_dtl_valdn_data-RoleForLambda"]
    iam_role_write_permission  = ["poc-cust360-events-pymnt_dtl_valdn_data-RoleForLambda"]
    iam_role_delete_permission = []
    read_prefix                = []
    write_prefix               = []
    delete_prefix              = []
  }
	s3_tags = {}
  }
]*/



###########################################
###   S3 Event Notification Variables   ###
###########################################
variable "s3_bucket_event_notification" {
  description = "The name of the bucket which needed event notification"
  type        = list(string)
  default     = []
}

variable "event_list" {
  description = "Specifies event for which to send notifications"
  type        = list(any)
  default     = []
}


#######################################################
###   S3 Event Notification With Filter Variables   ###
#######################################################
variable "s3_bucket_event_notification_with_filter" {
  description = "The name of the bucket which needed event notification"
  type        = list(string)
  default     = []
}

variable "event_list_filter" {
  description = "Specifies event for which to send notifications"
  type        = list(any)
  default     = []
}

variable "filter_prefix" {
  type    = string
  default = ""
}

variable "filter_suffix" {
  type    = string
  default = ""
}


## ***** IMP:- Should not delete below variables even it is not used ***** ##
######################################
###        SNS Variables           ###
######################################
variable "sns_name" {
  description = "The name of the topic"
  type        = string
  default     = ""
}

variable "display_name" {
  description = "The display name for the topic"
  type        = string
  default     = ""
}

variable "delivery_policy" {
  description = "The SNS delivery policy"
  type        = string
  default     = ""
}

variable "sns_tags" {
  description = "A map of tags to assign to the SNS topic"
  type        = map(string)
  default     = {}
}


######################################
###          IAM Variables         ###
######################################
variable iam_role_name {
  type        = string
  description = "IAM Role Name to be created"
}

variable iam_policy_name {
  type        = string
  description = "IAM Inline Policy to be created attaching to role"
}

variable tables_read_permission {
  type        = list(string)
  description = "List of tables require read permission by lambda"
  default     = []
}

variable tables_write_permission {
  type        = list(string)
  description = "List of tables require write permission by lambda"
  default     = []
}

variable tables_delete_permission {
  type        = list(string)
  description = "List of tables require delete permission by lambda"
  default     = []
}

variable s3buckets_read_permission {
  type        = list(string)
  description = "List of S3 Buckets require read permission by lambda"
  default     = []
}

variable s3buckets_write_permission {
  type        = list(string)
  description = "List of S3 Buckets require write permission by lambda"
  default     = []
}

variable s3buckets_delete_permission {
  type        = list(string)
  description = "List of S3 Buckets require delete permission by lambda"
  default     = []
}

variable "iam_tags" {
  description = "A map of tags to assign to the IAM role to be assumed by Lambda"
  type        = map(string)
  default     = {}
}


## ***** IMP:- Should not delete below variables even it is not used ***** ##
######################################
###   Secrets Manager Variables    ###
######################################
variable "secret_name" {
  description = "The name of the secret"
  type        = string
  default     = ""
}

variable "secret_description" {
  description = "The description of the secret"
  type        = string
  default     = ""
}

variable "secret_manager_tags" {
  description = "A map of tags to assign to the secret manager"
  type        = map(string)
  default     = {}
}


## ***** IMP:- Should not delete below variables even it is not used ***** ##
######################################
###         KMS Variables          ###
######################################
variable "kms_alias_name" {
  type        = string
  default     = ""
  description = "Alias name of KMS"
}


######################################
###     Event Bridge Variables     ###
######################################
variable "event_bridge_name" {
  description = "Name of the Event Bridge function"
  type        = string
  default     = ""
}

variable "event_bridge_description" {
  description = "Name of the Event Bridge function"
  type        = string
  default     = ""
}

variable "rule_name" {
  description = "Name of the Event Bridge Rule"
  type        = string
  default     = ""
}

variable "schedule_expression" {
  description = "Expression can be cron(0 0 * * ? *)"
  # * * * * *  command to execute
  # │ │ │ │ │
  # │ │ │ │ │
  # │ │ │ │ └───── day of week (0 - 6) (0 to 6 are Sunday to Saturday, or use names; 7 is Sunday, the same as 0)
  # │ │ │ └────────── month (1 - 12)
  # │ │ └─────────────── day of month (1 - 31)
  # │ └──────────────────── hour (0 - 23)
  # └───────────────────────── min (0 - 59)
  type        = string
  default     = ""
}

variable "event_bridge_tags" {
  type    = map(string)
  default = {}
}

######################################
###         SFTP Variables         ###
######################################
//Should not remove this variable if sftp is used
variable "sftp_server_accountid" {
  type    = string
  default = ""
}

variable "sftp_source_bucket" {
  type    = string
  default = ""
}

variable "sftp_user_iam_role" {
  type    = string
  default = ""
}


######################################
###        Common Variables        ###
######################################
variable "tags" {
  type    = map(string)
  default = {}
}




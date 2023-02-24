######################################
###       Lambda Variables         ###
######################################
function_name      = "dev-Customer-demoproject_search"
#function_filename  = "../microservices/build/libs/Demoproject-prl-batch-1.0.0-SNAPSHOT.jar"
handler            = ""
function_runtime   = "java11"
lambda_memory_size = 512
timeout            = 60
alias_name         = "dev"
env_variables = {
  AWS_XRAY_TRACING_NAME = "ApigwTest"
  CONFIG_TABLE_NAME     = "dev-Customer-demoproject_search-configuration"
  ERROR_TABLE_NAME      = "dev-Customer-demoproject_search-error_codes"
  ERROR_TEXT_TABLE_NAME = "dev-Customer-demoproject_search-error_texts"
  LogResponse           = "true"
  REGION                = "eu-west-1"
}
layers                    = ["dev-aws-services-sdk-layer-jars","dev-thirdparty-frameworks-layer-jars-1", "dev-thirdparty-frameworks-layer-jars-2","dev-ba-internal-framework-layer-jars"]
prov_concurrent_execution = 0
lambda_tags               = {}


######################################
###     DynamoDB Variables         ###
######################################
dynamodb = [{
  table_name     = "dev-Customer-demoproject_search-configuration",
  hash_key       = "KEY",
  hash_key_type  = "S",
  range_key      = "",
  range_key_type = "",
  ttl_attribute  = "",
  table_tags     = {}
  }, {
  table_name     = "dev-Customer-demoproject_search-error_codes",
  hash_key       = "BACKEND_ERROR_CODE",
  hash_key_type  = "S",
  range_key      = "",
  range_key_type = "",
  ttl_attribute  = "",
  table_tags     = {}
  }, {
  table_name     = "dev-Customer-demoproject_search-error_texts",
  hash_key       = "ERROR_CODE",
  hash_key_type  = "S",
  range_key      = "",
  range_key_type = "",
  ttl_attribute  = "",
  table_tags     = {}
}]


//If s3 is not available for your interface. Please remove below variables
#########################################
###         S3 Variables              ###
###  Refer variables.tf for examples  ###
#########################################
s3 = [{
  bucket_name        = ""
  versioning_enabled = true
  encryption_enabled = true
  lifecycle_rules    = []
  s3_tags            = {}
  bucket_policy = {
    iam_role_list_permission   = []
    iam_role_read_permission   = []
    iam_role_write_permission  = []
    iam_role_delete_permission = []
    iam_user_list_permission   = []
    iam_user_read_permission   = []
    iam_user_write_permission  = []
    iam_user_delete_permission = []
    read_prefix                = []
    write_prefix               = []
    delete_prefix              = []
  }
}]


###########################################
###   S3 Event Notification Variables   ###
###########################################
s3_bucket_event_notification = [""]
event_list                   = ["s3:ObjectCreated:Put", "s3:ObjectCreated:Post"]


//If s3 event notification with filter is not available for your interface. Please remove below variables
#######################################################
###   S3 Event Notification With Filter Variables   ###
#######################################################
s3_bucket_event_notification_with_filter = [""]
event_list_filter                        = ["s3:ObjectCreated:Put", "s3:ObjectCreated:Post"]
filter_prefix                            = ""
filter_suffix                            = ""


######################################
###        SNS Variables           ###
######################################
sns_name        = ""
display_name    = ""
delivery_policy = <<EOT
{
  "http": {
    "defaultHealthyRetryPolicy": {
      "minDelayTarget": 20,
      "maxDelayTarget": 20,
      "numRetries": 3,
      "numMaxDelayRetries": 0,
      "numNoDelayRetries": 0,
      "numMinDelayRetries": 0,
      "backoffFunction": "linear"
    },
    "disableSubscriptionOverrides": false,
    "defaultThrottlePolicy": {
      "maxReceivesPerSecond": 1
    }
  }
}
EOT
sns_tags        = {}


######################################
###          IAM Variables         ###
######################################
iam_role_name               = "dev-lambda_iam_role-Demoproject-prl-batch"
iam_policy_name             = "dev-lambda_iam_policy-Demoproject-prl-batch"
s3buckets_read_permission   = []
s3buckets_write_permission  = []
s3buckets_delete_permission = []
tables_read_permission      = []
tables_write_permission     = []
tables_delete_permission    = []
iam_tags                    = {}


//If secret is not available for your interface. Please remove below variables
######################################
###   Secrets Manager Variables    ###
######################################
secret_name         = ""
secret_description  = "This is a key/value secret"
secret_manager_tags = {}


//If KMS is not available for your interface. Please remove below variables
######################################
###         KMS Variables          ###
######################################
kms_alias_name = ""


//If event bridge is not available for your interface. Please remove below variables
######################################
###     Event Bridge Variables     ###
######################################
event_bridge_name        = ""
event_bridge_description = ""
rule_name                = ""
schedule_expression      = ""
event_bridge_tags        = ""


//If SFTP is not available for your interface. Please remove below variables
######################################
###         SFTP Variables         ###
######################################
sftp_source_bucket    = ""
sftp_user_iam_role    = ""


######################################
###        Common Variables        ###
######################################
tags = {
  Project     = "Customer360"
  Application = "sample"
  Tier        = "Public"
  CostCenter  = "Customer360"
  Environment = "dev"
  Owner       = "DevOps"
}

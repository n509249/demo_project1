######################################
###       IAM Glue Variables       ###
######################################

glue_database_name = "dev-cpm-report-automation_database1"

######################################
###       IAM Glue Variables       ###
######################################
iam_glue_roles = [
  {
    iam_role                    = "dev-cpm-report-automation_poc_role",
    iam_policy                  = "dev-cpm-report-automation_poc-iam_policy",
    s3buckets_read_permission   = ["dev-cpm-reporting-poc-s3"],
    s3buckets_write_permission  = ["dev-cpm-reporting-poc-s3"],
    s3buckets_delete_permission = ["dev-cpm-reporting-poc-s3"],
    secrets_manager_permission  = "",
    lambda_function_permission  = "",
    lambda_function_alias       = "",
    database_permission         = ["dev-cpm-report-automation_database1"],
    tags                        = {}
  }
]


######################################
### GLUE Crawler ###
######################################
crawlers = [{
crawler_name = "dev-cpm-report-automation_poc1"
iam_glue_role = "dev-cpm-report-automation_poc_role"
classifiers = []
crawler_scheduler = ""
recrawl_policy = "CRAWL_EVERYTHING"
glue_database_name = "dev-cpm-report-automation_database1"
s3_target_bucket = "dev-cpm-reporting-poc-s3/"
sample_size = 1
tags = {}
}
]

######################################
###       Athena Variables         ###
######################################

athena_workgroup   = "dev-cust360-cpm-automation-workgroup"
#source_s3          = "dev-cpm-reporting-poc-s3"
athena_state       = "ENABLED"
s3_output_location = "s3://dev-cpm-reporting-poc-s3-workspace/"

######################################
###        Common Variables        ###
######################################
tags = {
}

//If s3 is not available for your interface. Please remove below variables
#########################################
###         S3 Variables              ###
###  Refer variables.tf for examples  ###
#########################################
s3 = [{
  bucket_name        = "dem01234"
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


###########################
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

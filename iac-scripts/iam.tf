module "lambda_iam_role" {
  source                      = "./batch-modules/modules/iam"
  depends_on                  = [module.create_sns]
  iam_policy_name             = var.iam_policy_name
  iam_role_name               = var.iam_role_name
  tables_read_permission      = var.tables_read_permission
  tables_write_permission     = var.tables_write_permission
  tables_delete_permission    = var.tables_delete_permission
  function_name               = var.function_name
  s3buckets_read_permission   = var.s3buckets_read_permission
  s3buckets_write_permission  = var.s3buckets_write_permission
  s3buckets_delete_permission = var.s3buckets_delete_permission
  tags                        = merge(var.iam_tags, var.tags)
  secret_name                 = var.secret_name != "" ? [var.secret_name] : []
  sns_name                    = var.sns_name != "" ? [var.sns_name] : []
  kms_alias_name              = var.kms_alias_name != "" ? [var.kms_alias_name] : []
}

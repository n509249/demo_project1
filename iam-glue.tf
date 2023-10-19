module "iam-glue" {
  depends_on                  = [module.glue-database]
  source                      = "./modules/iam-glue"
  count                       = length(var.iam_glue_roles)
  iam_policy_name             = var.iam_glue_roles[count.index].iam_policy
  iam_role_name               = var.iam_glue_roles[count.index].iam_role
  s3buckets_read_permission   = var.iam_glue_roles[count.index].s3buckets_read_permission
  s3buckets_write_permission  = var.iam_glue_roles[count.index].s3buckets_write_permission
  s3buckets_delete_permission = var.iam_glue_roles[count.index].s3buckets_delete_permission
  secrets_manager_permission  = var.iam_glue_roles[count.index].secrets_manager_permission != "" ? [var.iam_glue_roles[count.index].secrets_manager_permission] : []
  lambda_function_permission  = var.iam_glue_roles[count.index].lambda_function_permission != "" ? [var.iam_glue_roles[count.index].lambda_function_permission] : []
  lambda_function_alias       = var.iam_glue_roles[count.index].lambda_function_alias
  database_permission         = var.iam_glue_roles[count.index].database_permission
  tags                        = merge(var.tags, var.iam_glue_roles[count.index].tags)
}

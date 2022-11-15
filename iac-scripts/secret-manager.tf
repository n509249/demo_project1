module "secrets-manager" {
  source             = "./batch-modules/modules/secret-manager"
  secret_name        = var.secret_name
  secret_description = var.secret_description
  iam_role_name      = var.iam_role_name
  tags               = merge(var.secret_manager_tags, var.tags)
}

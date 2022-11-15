module "create_sns" {
  source          = "./batch-modules/modules/sns"
  sns_name        = var.sns_name
  display_name    = var.display_name
  delivery_policy = var.delivery_policy
  tags            = merge(var.sns_tags, var.tags)
}
module "create_s3" {
  source                 = "./batch-modules/modules/s3"
  count                  = length(var.s3)
  bucket_name            = var.s3[count.index].bucket_name
  versioning_enabled     = var.s3[count.index].versioning_enabled
  server_side_encryption = var.s3[count.index].encryption_enabled
  lifecycle_rules        = var.s3[count.index].lifecycle_rules
  bucket_policy          = var.s3[count.index].bucket_policy
  tags                   = merge(var.s3[count.index].s3_tags, var.tags)
}

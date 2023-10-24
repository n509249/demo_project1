module "glue-crawler" {
  source = "./modules/glue-crawler"
  depends_on = [module.iam-glue]
  count = length(var.crawlers)
  crawler_name = var.crawlers[count.index].crawler_name
  iam_glue_role = var.crawlers[count.index].iam_glue_role
  classifiers = var.crawlers[count.index].classifiers
  crawler_scheduler = var.crawlers[count.index].crawler_scheduler
  glue_database_name = var.crawlers[count.index].glue_database_name
  recrawl_policy = var.crawlers[count.index].recrawl_policy
  s3_target_bucket = var.crawlers[count.index].s3_target_bucket
  sample_size = var.crawlers[count.index].sample_size
  tags = merge(var.tags, var.crawlers[count.index].tags)
}
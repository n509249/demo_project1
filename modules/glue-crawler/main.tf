#"cron(0 1 * * ? *)"

resource "aws_glue_crawler" "glue_crawler" {
  name          = var.crawler_name
  role          = var.iam_glue_role
  schedule      = var.crawler_scheduler
  classifiers   = var.classifiers
  database_name = var.glue_database_name
  tags          = var.tags

  recrawl_policy {
    recrawl_behavior = var.recrawl_policy
  }

  configuration = jsonencode(
  {
    Grouping = {
      TableGroupingPolicy = "CombineCompatibleSchemas"
    }
    CrawlerOutput = {
      Partitions = { AddOrUpdateBehavior = "InheritFromTable" }
    }
    Version = 1
  }
  )

  s3_target {
    path = "s3://${var.s3_target_bucket}"
  }
}
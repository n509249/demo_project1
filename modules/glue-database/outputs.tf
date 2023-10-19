#ARN of glue crawler
output "glue_crawler_arn" {
  description = "The ARN of the glue crawler"
  value       = aws_glue_catalog_database.aws_glue_catalog_database.arn
}
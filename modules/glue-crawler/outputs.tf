#ARN of glue crawler
output "glue_crawler_arn" {
  description = "The ARN of the glue crawler"
  value       = aws_glue_crawler.glue_crawler.arn
}
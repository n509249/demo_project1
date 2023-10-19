#ARN of iam role arn
output "iam_role_arn" {
  description = "The ARN of the Glue IAM role"
  value       = aws_iam_role.iam_glue_role.arn
}
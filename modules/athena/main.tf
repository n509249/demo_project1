resource "aws_athena_workgroup" "workgroup" {
  name  = var.athena_workgroup
  state = var.athena_state
  configuration {
    publish_cloudwatch_metrics_enabled = true
    result_configuration {
      output_location = var.s3_output_location
    }
  }
}



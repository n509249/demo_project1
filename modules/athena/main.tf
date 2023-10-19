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

/*data "aws_s3_bucket" "bucket" {
  bucket = var.source_s3
}

resource "aws_athena_database" "database" {
  name   = var.athena_db_name
  bucket = var.source_s3
}*/
resource "null_resource" "athena_tables" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = <<-EOT
      for file in "./table_creation/${var.alias_name}"/*.sql; do
        query=\$(cat "\$file")
        if [ -z "\$query" ]; then
          echo "Query in file \$file is empty or could not be read."
        else
          aws athena start-query-execution \
            --query-string="\$query" \
            --query-execution-context "Database=${var.glue_database_name}" \
            --result-configuration "OutputLocation=${var.s3_output_location}"
        fi
      done
    EOT
  }
}




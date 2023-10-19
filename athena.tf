module "athena" {
  source             = "./modules/athena"
  depends_on         = [module.glue-crawler]
  athena_workgroup   = var.athena_workgroup
  athena_state       = var.athena_state
  glue_database_name     = var.glue_database_name
  source_s3          = var.source_s3
  s3_output_location = var.s3_output_location
  alias_name         = var.alias_name
}
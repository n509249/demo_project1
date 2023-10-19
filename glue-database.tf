module "glue-database" {
  source = "./modules/glue-database"
  glue_database_name = var.glue_database_name
}
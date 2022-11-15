module "lambda_function" {
  depends_on                = [module.lambda_iam_role]
  source                    = "./batch-modules/modules/lambda"
  function_name             = var.function_name
  filename                  = var.function_filename
  handler                   = var.handler
  runtime                   = var.function_runtime
  lambda_memory_size        = var.lambda_memory_size
  timeout                   = var.timeout
  role                      = module.lambda_iam_role.main_lambda_iam_role_arn
  alias_name                = var.alias_name
  prov_concurrent_execution = var.prov_concurrent_execution
  layers                    = var.layers
  environment_variables     = var.env_variables
  tags                      = merge(var.lambda_tags, var.tags)
}

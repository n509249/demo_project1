module "event_bridge" {
  source                   = "./batch-modules/modules/event-bridge"
  depends_on               = [module.lambda_function]
  event_bridge_name        = var.event_bridge_name
  event_bridge_description = var.event_bridge_description
  rule_name                = var.rule_name
  schedule_expression      = var.schedule_expression
  function_name            = var.function_name
  alias_name               = var.alias_name
  lambda_function_arn      = module.lambda_function.lambda_function_arn
  lambda_alias_arn         = module.lambda_function.lambda_alias_arn
  tags                     = merge(var.event_bridge_tags, var.tags)
}

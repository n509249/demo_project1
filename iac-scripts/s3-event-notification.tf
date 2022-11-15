module "create_s3_event_notification" {
  depends_on                   = [module.lambda_function, module.create_s3]
  source                       = "./batch-modules/modules/s3-event-notification"
  count                        = length(var.s3_bucket_event_notification)
  s3_bucket_event_notification = var.s3_bucket_event_notification[count.index]
  event_list                   = var.event_list
  lambda_function_arn          = module.lambda_function.lambda_function_arn
  lambda_alias_arn             = module.lambda_function.lambda_alias_arn
  alias_name                   = var.alias_name
}
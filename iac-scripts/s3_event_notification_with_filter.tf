module "create_s3_event_notification_with_filter" {
  depends_on                   = [module.lambda_function, module.create_s3]
  source                       = "./batch-modules/modules/s3-event-notification"
  count                        = length(var.s3_bucket_event_notification_with_filter)
  s3_bucket_event_notification = var.s3_bucket_event_notification_with_filter[count.index]
  event_list                   = var.event_list_filter
  lambda_function_arn          = module.lambda_function.lambda_function_arn
  lambda_alias_arn             = module.lambda_function.lambda_alias_arn
  alias_name                   = var.alias_name
  filter_prefix                = var.filter_prefix
  filter_suffix                = var.filter_suffix
}
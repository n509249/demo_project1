module "dynamodb_table" {
  source    = "./batch-modules/modules/dynamodb"
  count     = length(var.dynamodb)
  name      = var.dynamodb[count.index].table_name
  hash_key  = var.dynamodb[count.index].hash_key
  range_key = var.dynamodb[count.index].range_key
  hash_key_attribute = {
    name = var.dynamodb[count.index].hash_key
    type = var.dynamodb[count.index].hash_key_type
  }
  range_key_attribute = {
    name = var.dynamodb[count.index].range_key
    type = var.dynamodb[count.index].range_key_type
  }
  ttl_attribute = var.dynamodb[count.index].ttl_attribute
  tags = merge(var.dynamodb[count.index].table_tags, var.tags)
}

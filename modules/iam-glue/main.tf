resource "aws_iam_role" "iam_glue_role" {
  name               = var.iam_role_name
  tags               = var.tags
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": ["glue.amazonaws.com"]
      },
      "Effect": "Allow",
      "Sid": "GlueJobPolicy"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy" "iam_glue_policy" {
  name   = var.iam_policy_name
  role   = aws_iam_role.iam_glue_role.id
  policy = data.aws_iam_policy_document.policy.json
}

data "aws_iam_policy_document" "policy" {
  dynamic "statement" {
    for_each = length(var.s3buckets_read_permission) == 0 || contains(var.s3buckets_read_permission, "*") ? [] : [1]
    content {
      sid = "S3BucketReadPermissions"
      actions = [
        "s3:GetObject",
        "s3:ListBucket"
      ]
      resources = concat([for bucket_name in var.s3buckets_read_permission : "arn:aws:s3:::${bucket_name}/*"], [for bucket_name in var.s3buckets_read_permission : "arn:aws:s3:::${bucket_name}"])
    }
  }

  dynamic "statement" {
    for_each = length(var.s3buckets_write_permission) == 0 || contains(var.s3buckets_write_permission, "*") ? [] : [1]
    content {
      sid = "S3BucketWritePermissions"
      actions = [
        "s3:PutObject"
      ]
      resources = [for bucket_name in var.s3buckets_write_permission : "arn:aws:s3:::${bucket_name}/*"]
    }
  }

  dynamic "statement" {
    for_each = length(var.s3buckets_delete_permission) == 0 || contains(var.s3buckets_delete_permission, "*") ? [] : [1]
    content {
      sid = "S3BucketDeletePermissions"
      actions = [
        "s3:DeleteObject"
      ]
      resources = [for bucket_name in var.s3buckets_delete_permission : "arn:aws:s3:::${bucket_name}/*"]
    }
  }

  dynamic "statement" {
    for_each = length(var.secrets_manager_permission) == 0 || contains(var.secrets_manager_permission, "*") ? [] : [1]
    content {
      sid = "SecretsManagerGetSecretPermissions"
      actions = [
        "secretsmanager:GetSecretValue"
      ]
      resources = data.aws_secretsmanager_secret.secret.*.arn
    }
  }

  dynamic "statement" {
    for_each = length(var.lambda_function_permission) == 0 || contains(var.lambda_function_permission, "*") ? [] : [1]
    content {
      sid = "LambdaInvokePermissions"
      actions = [
        "lambda:InvokeFunction"
      ]
      resources = ["arn:aws:lambda:${local.region}:${local.account_id}:function:${var.lambda_function_permission[0]}:${var.lambda_function_alias}"]
    }
  }

  dynamic "statement" {
    for_each = length(var.database_permission) == 0 || contains(var.database_permission, "*") ? [] : [1]
    content {
      sid = "DatabasePermissions"
      actions = [
        "glue:GetTable",
        "glue:UpdateTable",
        "glue:GetPartition",
        "glue:GetPartitions",
        "glue:UpdatePartition",
        "glue:BatchGetPartition",
        "glue:GetDatabase",
        "glue:CreateDatabase",
        "glue:BatchCreatePartition",
        "glue:CreateTable"
      ]
       resources = concat([for db_name in var.database_permission : "arn:aws:glue:${local.region}:${local.account_id}:catalog"],
                  [for db_name in var.database_permission : "arn:aws:glue:${local.region}:${local.account_id}:database/${db_name}-*"],
                  [for db_name in var.database_permission : "arn:aws:glue:${local.region}:${local.account_id}:table/${db_name}-*/*"])
    }
  }

  statement {
    sid = "StartCrawlerPermission"
    actions = [
      "glue:StartCrawler"
    ]
    resources = ["arn:aws:glue:${local.region}:${local.account_id}:crawler/*"]
  }

  statement {
    sid = "StartJobRunPermission"
    actions = [
      "glue:StartJobRun"
    ]
    resources = ["arn:aws:glue:${local.region}:${local.account_id}:*"]
  }

  statement {
    sid = "CloudwatchCreateLogStreamPermission"
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:CreateLogGroup"
    ]
    resources = ["arn:aws:logs:${local.region}:${local.account_id}:log-group:/aws-glue/python-jobs/output:*"
    , "arn:aws:logs:${local.region}:${local.account_id}:log-group:/aws-glue/python-jobs/error:*"
    , "arn:aws:logs:${local.region}:${local.account_id}:log-group:/aws-glue/jobs/error:*"
    , "arn:aws:logs:${local.region}:${local.account_id}:log-group:/aws-glue/jobs/logs-v2:*"
    , "arn:aws:logs:${local.region}:${local.account_id}:log-group:/aws-glue/jobs/output:*"
    , "arn:aws:logs:${local.region}:${local.account_id}:log-group:/aws-glue/crawlers:*"]
  }
}

data "aws_secretsmanager_secret" "secret" {
  count = length(var.secrets_manager_permission)
  name  = var.secrets_manager_permission[count.index]
}

data "aws_iam_policy" "example" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}
resource "aws_iam_role_policy_attachment" "attach_policy" {
  policy_arn = data.aws_iam_policy.example.arn
  role       = aws_iam_role.iam_glue_role.name
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
}

data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
  tags = {
    Author = "Terraform"
  }
}

resource "aws_macie2_account" "macie" {
  status = "ENABLED"
}

resource "aws_macie2_classification_job" "job" {
  job_type          = "ONE_TIME"
  name              = "One time S3 scan"
  s3_job_definition {
    bucket_definitions {
      account_id    = local.account_id
      buckets       = [aws_s3_bucket.pii.bucket]
    }
  }

  tags        = local.tags
  depends_on  = [aws_macie2_account.macie]
}

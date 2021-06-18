resource "aws_s3_bucket" "pii" {
  bucket = "ps-ncentola-2w-super-secret"
  acl    = "private"
}

resource "aws_s3_bucket_object" "pii_unencrypted" {
  bucket  = aws_s3_bucket.pii.bucket
  key     = "super_fake_pii.csv"
  source  = "../python/super_fake_pii.csv"
  etag    = filemd5("../python/super_fake_pii.csv")
}

resource "aws_kms_key" "key" {
  description             = "A key"
  deletion_window_in_days = 7
  # policy                  = data.aws_iam_policy_document.kms_macie.json

  # depends_on = [aws_iam_policy_document.kms_macie]
}

resource "aws_s3_bucket_object" "pii_encrypted" {
  bucket      = aws_s3_bucket.pii.bucket
  key         = "super_fake_pii_ENCRYPTED.csv"
  source      = "../python/super_fake_pii.csv"
  kms_key_id  = aws_kms_key.key.arn

  # etag        = filemd5("../python/super_fake_pii.csv")
}

data "aws_iam_policy_document" "kms_macie" {
  statement {
    effect  = "Allow"
    actions = ["kms:*"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${local.account_id}:root"]
    }
  }

  statement {
    effect  = "Allow"
    actions = ["kms:Decrypt"]

    principals {
      type        = "AWS"
      identifiers = [aws_macie2_account.macie.service_role]
    }
  }
}

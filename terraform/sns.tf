module "notify_slack" {
  source  = "terraform-aws-modules/notify-slack/aws"
  version = "4.14.0"

  sns_topic_name   = aws_sns_topic.macie.name
  create_sns_topic = false

  slack_webhook_url = var.slack_webhook_url
  slack_channel     = "@ncentola"
  slack_username    = "MACIE"

  tags = {
    Name = "notify-slack-simple"
  }

  depends_on = [aws_sns_topic.macie]
}

resource "aws_sns_topic" "macie" {
  name = "macie-events"
}

resource "aws_sns_topic_policy" "default" {
  arn    = aws_sns_topic.macie.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}

data "aws_iam_policy_document" "sns_topic_policy" {
  statement {
    effect  = "Allow"
    actions = ["SNS:Publish"]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }

    resources = [aws_sns_topic.macie.arn]
  }
}

resource "aws_cloudwatch_event_rule" "macie" {
  name = "capture-all-macie-events"

  event_pattern = <<EOF
{
  "source": ["aws.macie"]
}
EOF
}

resource "aws_cloudwatch_event_target" "sns" {
  rule      = aws_cloudwatch_event_rule.macie.name
  target_id = "send-to-sns"
  arn       = aws_sns_topic.macie.arn
}

resource "aws_cloudwatch_event_rule" "guardduty_findings" {
  name        = "project-23-guardduty-findings"
  description = "Send medium and high severity GuardDuty findings to SNS"

  event_pattern = jsonencode({
    source      = ["aws.guardduty"]
    detail-type = ["GuardDuty Finding"]
    detail = {
      severity = [
        {
          numeric = [">=", 4]
        }
      ]
    }
  })
}

resource "aws_cloudwatch_event_target" "sns" {
  rule      = aws_cloudwatch_event_rule.guardduty_findings.name
  target_id = "SendToSNS"
  arn       = aws_sns_topic.security_alerts.arn

  input_transformer {
    input_paths = {
      account     = "$.account"
      region      = "$.region"
      finding_id  = "$.detail.id"
      finding     = "$.detail.type"
      severity    = "$.detail.severity"
      title       = "$.detail.title"
      description = "$.detail.description"
      resource    = "$.detail.resource.resourceType"
    }

    input_template = <<EOF_MESSAGE
{
  "subject": "AWS GuardDuty Security Alert",
  "account": "<account>",
  "region": "<region>",
  "finding_id": "<finding_id>",
  "finding_type": "<finding>",
  "severity": "<severity>",
  "title": "<title>",
  "description": "<description>",
  "resource_type": "<resource>"
}
EOF_MESSAGE
  }
}

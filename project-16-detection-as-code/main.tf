# SNS Topic

resource "aws_sns_topic" "security_alerts" {
  name              = "security-alerts"
  kms_master_key_id = "alias/aws/sns"
}

# Email Subscription

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.security_alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}

# EventBridge Rule - Root Login Detection

resource "aws_cloudwatch_event_rule" "root_login" {

  name = "root-login-detection"

  description = "Detect AWS Root account logins"

  event_pattern = jsonencode({
    source = ["aws.signin"]

    detail-type = [
      "AWS Console Sign In via CloudTrail"
    ]

    detail = {
      userIdentity = {
        type = ["Root"]
      }
    }
  })
}
resource "aws_cloudwatch_event_rule" "failed_console_login" {
  name        = "failed-console-login-detection"
  description = "Detect failed AWS Console login attempts"

  event_pattern = jsonencode({
    source = ["aws.signin"]

    detail-type = [
      "AWS Console Sign In via CloudTrail"
    ]

    detail = {
      responseElements = {
        ConsoleLogin = ["Failure"]
      }
    }
  })
}

resource "aws_cloudwatch_event_target" "failed_console_login_target" {
  rule = aws_cloudwatch_event_rule.failed_console_login.name
  arn  = aws_sns_topic.security_alerts.arn
}
resource "aws_cloudwatch_event_rule" "security_group_changes" {
  name        = "security-group-changes-detection"
  description = "Detect changes to AWS Security Groups"

  event_pattern = jsonencode({
    source = ["aws.ec2"]

    detail-type = [
      "AWS API Call via CloudTrail"
    ]

    detail = {
      eventSource = ["ec2.amazonaws.com"]

      eventName = [
        "AuthorizeSecurityGroupIngress",
        "AuthorizeSecurityGroupEgress",
        "RevokeSecurityGroupIngress",
        "RevokeSecurityGroupEgress",
        "CreateSecurityGroup",
        "DeleteSecurityGroup"
      ]
    }
  })
}

resource "aws_cloudwatch_event_target" "security_group_changes_target" {
  rule = aws_cloudwatch_event_rule.security_group_changes.name
  arn  = aws_sns_topic.security_alerts.arn
}

# IAM Policy / Role Changes
resource "aws_cloudwatch_event_rule" "iam_changes" {
  name        = "iam-changes-detection"
  description = "Detect IAM policy, role, user, and group changes"

  event_pattern = jsonencode({
    source = ["aws.iam"]

    detail-type = [
      "AWS API Call via CloudTrail"
    ]

    detail = {
      eventSource = ["iam.amazonaws.com"]

      eventName = [
        "CreateUser",
        "DeleteUser",
        "CreateRole",
        "DeleteRole",
        "UpdateRole",
        "AttachUserPolicy",
        "DetachUserPolicy",
        "AttachRolePolicy",
        "DetachRolePolicy",
        "PutUserPolicy",
        "DeleteUserPolicy",
        "PutRolePolicy",
        "DeleteRolePolicy",
        "CreatePolicy",
        "DeletePolicy",
        "CreateAccessKey",
        "DeleteAccessKey",
        "UpdateAccessKey",
        "AddUserToGroup",
        "RemoveUserFromGroup"
      ]
    }
  })
}

resource "aws_cloudwatch_event_target" "iam_changes_target" {
  rule = aws_cloudwatch_event_rule.iam_changes.name
  arn  = aws_sns_topic.security_alerts.arn
}
# GuardDuty

resource "aws_guardduty_detector" "main" {
  enable = true
}

#EventBridge
resource "aws_cloudwatch_event_rule" "guardduty_findings" {
  name        = "guardduty-findings-detection"
  description = "Detect GuardDuty security findings"

  event_pattern = jsonencode({
    source = ["aws.guardduty"]

    detail-type = [
      "GuardDuty Finding"
    ]
  })
}

#SNS
resource "aws_cloudwatch_event_target" "guardduty_findings_target" {
  rule = aws_cloudwatch_event_rule.guardduty_findings.name
  arn  = aws_sns_topic.security_alerts.arn
}
# EventBridge Target

resource "aws_cloudwatch_event_target" "root_login_target" {

  rule = aws_cloudwatch_event_rule.root_login.name

  arn = aws_sns_topic.security_alerts.arn
}



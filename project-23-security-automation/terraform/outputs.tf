output "guardduty_detector_id" {
  description = "GuardDuty detector ID"
  value       = aws_guardduty_detector.main.id
}

output "securityhub_enabled" {
  description = "Security Hub account resource"
  value       = aws_securityhub_account.main.id
}

output "sns_topic_arn" {
  description = "SNS topic used for security alerts"
  value       = aws_sns_topic.security_alerts.arn
}

output "eventbridge_rule_name" {
  description = "EventBridge rule that processes GuardDuty findings"
  value       = aws_cloudwatch_event_rule.guardduty_findings.name
}

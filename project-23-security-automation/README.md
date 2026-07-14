# Project 23 - AWS Security Hub, GuardDuty & Incident Response Automation

## Overview

This project demonstrates an AWS-native threat detection and incident response workflow using:

- GuardDuty
- Security Hub
- EventBridge
- SNS
- Terraform

## Architecture

```text
GuardDuty
    ↓
Security Hub
    ↓
EventBridge
    ↓
SNS
    ↓
Email Alert
```

## Validation

- Generated GuardDuty sample findings.
- Received EventBridge events.
- Delivered SNS email notifications.
- Validated Security Hub integration.

## Findings Tested

- UnauthorizedAccess:EC2/SSHBruteForce
- Recon:EC2/PortProbeUnprotectedPort
- Trojan:EC2/BlackholeTraffic

## Skills Demonstrated

- Cloud Security
- Threat Detection
- Security Automation
- Incident Response
- Detection Engineering
- Infrastructure Security

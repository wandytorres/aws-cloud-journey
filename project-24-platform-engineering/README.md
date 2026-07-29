# Project 24 – Internal Developer Platform on Amazon EKS

## Overview

This project demonstrates the design and implementation of an Internal Developer Platform using Amazon EKS, Terraform, GitHub Actions, ArgoCD, Helm, observability, and cloud-native security tools.

The platform enables developers to deploy applications declaratively through GitOps while the platform engineering layer manages infrastructure, security, reliability, and observability.

## Architecture

```text
Developer
    |
    v
GitHub Repository
    |
    v
GitHub Actions
    |
    v
ArgoCD
    |
    v
Amazon EKS
    |
    +-- Platform Application
    +-- Prometheus
    +-- Grafana
    +-- Loki
    +-- Falco

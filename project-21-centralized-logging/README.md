# Project 21 – Centralized Logging with Loki and Grafana

## Overview

This project implements centralized logging for Kubernetes using Loki, Promtail, and Grafana.

## Architecture

Kubernetes Pods → Promtail → Loki → Grafana → LogQL Queries

## Technologies

- Amazon EKS
- Kubernetes
- Helm
- Loki
- Promtail
- Grafana
- LogQL

## Objectives

- Deploy Loki
- Deploy Promtail
- Collect Kubernetes logs
- Query logs using LogQL
- Visualize logs in Grafana
- Validate centralized logging

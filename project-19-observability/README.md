# Project 19 – Kubernetes Observability (Prometheus + Grafana)

## Overview

This project demonstrates how to build an observability platform for Kubernetes using the Prometheus Operator and Grafana.

The monitoring stack collects metrics from Kubernetes nodes, pods, containers, kubelets, and cluster components, providing real-time dashboards for infrastructure monitoring.

---

# Architecture

```
Kubernetes Cluster
        │
        ▼
Prometheus Operator
        │
        ▼
Prometheus
        │
        ▼
Grafana Dashboards
```

---

## Technologies

- Amazon EKS
- Kubernetes
- Helm
- Prometheus Operator
- Prometheus
- Grafana
- kube-state-metrics
- Node Exporter

---

## Installation

### Create Monitoring Namespace

```bash
kubectl create namespace monitoring
```

### Add Helm Repository

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo update
```

### Install kube-prometheus-stack

```bash
helm install monitoring prometheus-community/kube-prometheus-stack \
-n monitoring
```

---

## Verify Installation

```bash
kubectl get pods -n monitoring

kubectl get svc -n monitoring
```

---

## Expose Grafana

```bash
kubectl patch svc monitoring-grafana \
-n monitoring \
-p '{"spec":{"type":"LoadBalancer"}}'
```

Obtain the external endpoint:

```bash
kubectl get svc monitoring-grafana -n monitoring
```

Retrieve the admin password:

```bash
kubectl get secret monitoring-grafana \
-n monitoring \
-o jsonpath="{.data.admin-password}" | base64 -d
```

---

# Dashboards

The project validates several Grafana dashboards:

- Kubernetes Cluster
- Kubernetes Nodes
- Kubernetes Pods
- Kubernetes Kubelet
- Node Exporter
- CPU Utilization
- Memory Utilization
- Network Metrics

---

# Monitoring Validation

Verified metrics:

- Running Nodes
- Running Pods
- Running Containers
- CPU Usage
- Memory Usage
- Kubelet Operations
- Node Exporter Metrics

---

# High Availability Test

To validate monitoring under workload, a Deployment with 20 replicas was created.

```bash
kubectl scale deployment nginx-demo --replicas=20
```

Observed behavior:

- Pods transitioned from ContainerCreating to Running.
- Metrics updated automatically in Grafana.
- Prometheus collected the new metrics successfully.

---

# Screenshots

```
screenshots/

grafana-home.png

grafana-kubelet.png

grafana-node-metrics.png

pods-scaling.png
```

---

# Skills Demonstrated

- Kubernetes Monitoring
- Prometheus Operator
- Grafana Dashboards
- Metrics Collection
- Cluster Observability
- Kubernetes Troubleshooting
- High Availability Validation
- Helm Package Management

---

## Project Status

Completed

```
Monitoring Stack Installed

Grafana Operational

Prometheus Collecting Metrics

Node Exporter Working

Kubernetes Dashboards Operational

Observability Platform Validated
```

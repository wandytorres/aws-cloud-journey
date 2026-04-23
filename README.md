# 🚀 DevOps & Cloud Journey – Wandy Torres

This repository documents my hands-on journey becoming a Cloud & DevOps Engineer using AWS and Terraform.

---

## 🧱 Projects

### 🔹 Project 1 – Static Website (S3 + CloudFront)

* Deployed a static website using AWS S3
* Configured CloudFront for HTTPS delivery
* Learned bucket policies and CDN behavior

---

### 🔹 Project 2 – Terraform S3

* Provisioned S3 using Terraform
* Introduced Infrastructure as Code (IaC)
* Practiced `init`, `plan`, `apply`, `destroy`

---

### 🔹 Project 3 – Terraform + CloudFront

* Automated full website deployment with Terraform
* Created S3 + CloudFront distribution
* Learned provisioning delays and CDN lifecycle

---

### 🔹 Project 4 – EC2 + Nginx (Terraform)

* Deployed EC2 instance with Security Group
* Automated Nginx installation using `user_data`
* Exposed web server via public IP

---

## ⚙️ Project 5 CI/CD (GitHub Actions)

* Automated Terraform execution on push
* Integrated AWS authentication via OIDC (no static keys)
* Secure deployment pipeline

---

## 🔐 Security Improvements

* Migrated from AWS Access Keys → OIDC authentication
* Restricted IAM role to:

  * specific repository
  * specific branch (main)

---

## Project 6 CI/CD and Security

### GitHub Actions Pipeline

* Automated Terraform execution on push to `main`
* Added format, validation, and planning stages
* Protected deployments using GitHub Environments

### Secure AWS Authentication

* Replaced static AWS access keys with GitHub OIDC federation
* Configured an IAM role restricted to:

  * repository: `wandytorres/aws-cloud-journey`
  * environment: `production`

### Deployment Controls

* Added manual approval before production execution
* Added a separate workflow for manual destroy operations

---
## 🌍 Multi-Environment Structure

This repository includes a reusable Terraform module and separate environments:

* `modules/ec2-nginx` → reusable EC2 + Nginx module
* `environments/dev` → development deployment
* `environments/prod` → production deployment
---
* ## 🔄 Multi-Environment CI/CD

The repository uses separate GitHub Actions workflows for each environment:

* `deploy-dev.yml` → automatic deployment for development
* `deploy-prod.yml` → manual production deployment with approval
* `destroy.yml` → manual destroy workflow with environment selection

This approach improves safety, environment separation, and deployment control.
---
### Benefits

* Reusable Terraform code
* Environment separation
* Cleaner CI/CD promotion flow
* Easier scaling to real-world infrastructure
---
## 🚀 Next Steps

* Remote backend (S3 + DynamoDB)
* Multi-environment (dev / prod)
* Approval-based deployments
* Docker + Kubernetes

---

## 🧠 Key Skills Demonstrated

* AWS (S3, EC2, CloudFront, IAM)
* Terraform (IaC)
* Git & GitHub
* CI/CD pipelines
* Linux administration

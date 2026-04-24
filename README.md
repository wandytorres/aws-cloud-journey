# 🚀 DevOps & Cloud Journey – Wandy Torres

This repository documents my hands-on journey to becoming a Cloud & DevOps Engineer using AWS, Terraform, and CI/CD pipelines.

---

## 🧱 Projects

### 🔹 Project 1 – Static Website (S3 + CloudFront)

* Deployed a static website using AWS S3
* Configured CloudFront for HTTPS delivery
* Learned bucket policies and CDN behavior

---

### 🔹 Project 2 – Terraform S3

* Provisioned S3 using Terraform (IaC)
* Practiced `init`, `plan`, `apply`, `destroy`
* Introduced infrastructure automation concepts

---

### 🔹 Project 3 – Terraform + CloudFront

* Automated full website deployment with Terraform
* Created S3 + CloudFront distribution
* Learned CDN lifecycle and propagation behavior

---

### 🔹 Project 4 – EC2 + Nginx (Terraform)

* Deployed EC2 instance with Security Group
* Automated Nginx installation using `user_data`
* Exposed web server via public IP

---

### 🔹 Project 5 – CI/CD Pipeline (GitHub Actions)

* Automated Terraform execution on push
* Implemented CI/CD workflow with GitHub Actions
* Introduced Infrastructure deployment automation

---

### 🔹 Project 6 – CI/CD Security & OIDC

* Replaced AWS Access Keys with OIDC authentication
* Configured IAM Role for GitHub Actions
* Secured pipeline with environment-based approvals

---

### 🔹 Project 7 – Multi-Environment Terraform (DEV / PROD)

* Created reusable Terraform module (`ec2-nginx`)
* Implemented environment separation (`dev` / `prod`)
* Used `terraform.tfvars` for environment configuration
* Integrated CI/CD workflows per environment

---

## ⚙️ CI/CD Architecture

The repository uses multiple GitHub Actions workflows:

* `deploy-dev.yml` → automatic deployment for development
* `deploy-prod.yml` → manual deployment with approval
* `destroy.yml` → manual destroy with environment selection

### Features

* Terraform automation (init, validate, plan, apply)
* OIDC authentication (no static credentials)
* Environment-based deployment control
* Safe production approvals

---

## 🔐 Security Best Practices

* Eliminated static AWS credentials
* Implemented GitHub OIDC federation
* Restricted IAM role access to:

  * specific repository
  * production environment
* Separated dev and prod configurations
* Restricted SSH access in production

---

## 🌍 Infrastructure Design

### Structure

* `modules/ec2-nginx` → reusable infrastructure module
* `environments/dev` → development environment
* `environments/prod` → production environment

### Benefits

* Code reusability
* Environment isolation
* Scalable architecture
* Production safety controls

---

## 🔧 Environment Configuration

Each environment uses its own `terraform.tfvars` file:

### Development

* Open access for testing
* Faster iteration
* Automatic deployment

### Production

* Restricted SSH access (IP-based)
* Manual approval before deployment
* Safer configuration

---

## 🧠 Key Skills Demonstrated

* AWS (S3, EC2, CloudFront, IAM)
* Terraform (Infrastructure as Code)
* CI/CD with GitHub Actions
* OIDC Authentication
* Multi-environment architecture
* Linux administration
* DevOps best practices

---

## 🚀 Next Step – Project 8 (In Progress)

### Docker + CI/CD + EC2 Deployment

* Containerize application using Docker
* Build Docker image in CI/CD pipeline
* Push image to container registry (ECR or Docker Hub)
* Deploy container to EC2 automatically
* Replace manual Nginx setup with container-based deployment

---

## 👨‍💻 Author

Wandy Torres
Cloud & DevOps Engineer in progress 🚀
# ecs trigger

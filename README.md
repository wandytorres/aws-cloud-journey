# 🚀 DevOps & Cloud Journey – Wandy Torres

This repository documents my hands-on journey to becoming a **Cloud & DevOps Engineer**, building real-world infrastructure using AWS, Terraform, Docker, and CI/CD pipelines.

---

## 🧱 Projects

### 🔹 Project 1 – Static Website (S3 + CloudFront)

* Deployed a static website using AWS S3
* Configured CloudFront for global HTTPS delivery
* Learned bucket policies and CDN behavior

---

### 🔹 Project 2 – Terraform S3

* Provisioned S3 infrastructure using Terraform (IaC)
* Practiced `init`, `plan`, `apply`, `destroy`
* Introduced infrastructure automation concepts

---

### 🔹 Project 3 – Terraform + CloudFront

* Automated full static website deployment
* Created S3 + CloudFront distribution
* Learned CDN lifecycle and propagation delays

---

### 🔹 Project 4 – EC2 + Nginx (Terraform)

* Deployed EC2 instance with Security Group
* Automated Nginx setup using `user_data`
* Exposed application via public IP

---

### 🔹 Project 5 – CI/CD Pipeline (GitHub Actions)

* Automated Terraform deployments on push
* Implemented CI/CD workflows using GitHub Actions
* Introduced infrastructure deployment automation

---

### 🔹 Project 6 – CI/CD Security (OIDC)

* Replaced AWS Access Keys with OIDC authentication
* Configured IAM Role for GitHub Actions
* Secured pipelines with environment-based approvals

---

### 🔹 Project 7 – Multi-Environment Terraform (DEV / PROD)

* Built reusable Terraform module (`ec2-nginx`)
* Implemented environment separation (`dev` / `prod`)
* Used `terraform.tfvars` for configuration
* Integrated CI/CD workflows per environment

---

## 🚀 Project 8 – Docker + CI/CD + EC2

* Containerized application using Docker
* Built and pushed images via CI/CD pipeline
* Deployed containers to EC2 using SSH automation
* Replaced manual server configuration with container-based deployment

---

## ☁️ Project 9 – ECS Fargate + ECR + CI/CD

* Built cloud-native container deployment pipeline
* Pushed Docker images to **Amazon ECR**
* Deployed application to **ECS Fargate (serverless containers)**
* Implemented CI/CD pipeline using GitHub Actions + OIDC
* Enabled rolling deployments with zero manual intervention

---

## 🌐 Project 10 – ECS + ALB + Auto Scaling (Production Architecture)

* Provisioned infrastructure using **Terraform**
* Deployed ECS Fargate service behind **Application Load Balancer**
* Configured **Target Group + Health Checks**
* Implemented **Auto Scaling based on CPU utilization**
* Achieved dynamic scaling (1–2 containers automatically)
* Built production-like architecture:

```text
Internet → ALB → ECS Fargate → Containers
```

---

## ⚙️ CI/CD Architecture

The repository uses multiple GitHub Actions workflows:

* `deploy-dev.yml` → automatic deployment for development
* `deploy-prod.yml` → manual deployment with approval
* `destroy.yml` → controlled resource destruction
* `deploy-ecs.yml` → container build + deploy to ECS

### Features

* Terraform automation (`init`, `validate`, `plan`, `apply`)
* Docker build and push pipelines
* OIDC authentication (no static credentials)
* Environment-based deployment control
* Rolling deployments in ECS

---

## 🔐 Security Best Practices

* Eliminated static AWS credentials
* Implemented GitHub OIDC federation
* Restricted IAM roles by repository and environment
* Applied least-privilege access model
* Separated dev and prod configurations

---

## 🌍 Infrastructure Design

### Structure

* `modules/` → reusable Terraform modules
* `environments/dev` → development environment
* `environments/prod` → production environment
* `project-*` → progressive real-world implementations

### Benefits

* Code reusability
* Environment isolation
* Scalable cloud architecture
* Safe production deployments

---

## 📦 Technologies Used

* AWS (S3, EC2, ECS, ECR, ALB, IAM, CloudWatch)
* Terraform (Infrastructure as Code)
* Docker (Containerization)
* GitHub Actions (CI/CD)
* OIDC (Secure authentication)
* Linux

---

## 🧠 Key Skills Demonstrated

* Cloud Infrastructure Design
* Infrastructure as Code (Terraform)
* CI/CD Pipelines
* Containerization & Orchestration
* AWS Cloud-Native Services
* Security Best Practices
* Auto Scaling & Load Balancing

---

## 🚀 Next Steps

* 🔒 HTTPS with ACM + custom domain
* 📊 Monitoring & alerting (CloudWatch)
* 🔄 Blue/Green deployments
* ☸️ Kubernetes (EKS)

---

## 👨‍💻 Author

**Wandy Torres**
Cloud & DevOps Engineer in progress 🚀

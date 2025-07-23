# SimpleApp Azure DevOps Challenge

## Overview

This repository demonstrates a cloud-native CI/CD pipeline that builds, tests, and deploys a containerized .NET 6 application to Azure Kubernetes Service (AKS) using infrastructure as code (Terraform) and Helm charts. The pipeline is automated with GitHub Actions.

### CI/CD Flow

- **Terraform Workflow (`terraform.yml`):**  
  Provisions Azure infrastructure including:  
  - Resource Group  
  - Azure Kubernetes Service (AKS) cluster  
  - Azure Container Registry (ACR)  
  - Azure PostgreSQL database stub  

- **Deployment Workflow (`deploy.yml`):**  
  - Builds and publishes the .NET app Docker image  
  - Pushes the image to Azure Container Registry (ACR)  
  - Deploys or upgrades the app in AKS via Helm charts  

This separation enables independent infrastructure provisioning and app deployment.

---

## Terraform Architecture & Rationale

- Modular Terraform code organized under `terraform/modules/` for each resource type (Resource Group, ACR, AKS, PostgreSQL).  
- Variables defined clearly per module and root for flexibility and reuse.  
- Secrets such as PostgreSQL admin password are passed securely via GitHub secrets and environment variables, not hardcoded.  
- Outputs expose critical information like the ACR login server for downstream use.  
- The root `main.tf` calls modules to build a consistent infrastructure graph, allowing a single `terraform apply` to provision all resources.  

---

## Assumptions & Simplifications

- The .NET app is a simple HTTP API printing a custom message for demonstration.  
- Resource sizing (AKS node count/size, PostgreSQL tier) uses minimal defaults for cost-efficiency.  
- Autoscaling and resource requests/limits are disabled or minimal in the Helm chart but can be enabled and tuned.  
- Secrets management in Kubernetes is simplified with no mounted secrets for the demo app.  
- Monitoring/logging is suggested but not implemented in this project to focus on core CI/CD and infra automation.  

---

## AI Tools Usage

This project was developed with assistance from AI tools including:
- **ChatGPT:** Helped design, write code, and troubleshoot configuration details.  

AI tools were used to increase productivity, improve code quality, and speed up delivery.

---

## Monitoring & Logging (Optional)

For production readiness, consider adding:  

- **Azure Monitor / Log Analytics:** To collect cluster logs, container logs, and application telemetry.  
- **Prometheus & Grafana:** For metrics collection and dashboards in AKS.  
- **Application Insights:** For deeper .NET application monitoring.  

These can be integrated with Helm charts or separate Terraform modules in future iterations.

---


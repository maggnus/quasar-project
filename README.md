# Quasar Project

The reference deployment for a High-Availability (HA) web application, incorporating best practices in security and
delivery through Continuous Integration/Continuous Deployment (CI/CD).

## Architecture overview

![Architecture overview](docs/images/architecture.jpeg)

## Demo

![Link](https://quasar.scalty.com)

## Requirements

Ensure that the following prerequisites are met:

- Terraform installed (version 1.6.X)
- Kubernetes CLI (kubectl) installed
- FluxCD CLI installed
- Access to the AWS cloud provider

## Features

### Application

- [x] Docker Image multistaging build
- [x] Helm chart packaging

### Terraform

- [ ] Terraform IAM module
- [x] Terraform VPC module
- [x] Terraform EKS module
- [x] Terraform Context module
- [ ] Terraform ALB module
- [ ] Terraform AWS Shield module

### Kubernetes

- [x] FluxCD integration
- [ ] Integration with external Secret Manager
- [ ] Integration with external DNS provider
- [ ] Service mesh integration

### CI/CD

- [x] GitHub Actions integration
- [x] Pulling images and helm charts from OCI Docker Registry (GitHub)
- [x] Integration with GitVerion tool
- [x] Support multi-deployment and multi-staging configuration
- [ ] Scan Docker images for vulnerabilities
- [ ] Static code analysis

## Deployment

TODO

## Development

For development purpose all components can be build and deploy separately
to have a more frequently development cycle

### Apply Terraform scripts

```bash
cd terraform/environments/01-quasar-dev
terraform init
terraform plan
terraform apply
```

### Configure access to the EKS cluster

```bash
aws eks update-kubeconfig --region ap-southeast-1 --name eks-1-quasar-dev
```

### Bootstrap FluxCD

```bash
flux bootstrap github \
         --owner=maggnus \
         --repository=quasar-project \
         --path ./k8s/environments/01-quasar-dev \
         --components-extra=image-reflector-controller,image-automation-controller
```

## Authors

- [@maggnus](https://www.github.com/maggnus)


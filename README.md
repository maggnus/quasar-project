# Quasar Project

The reference deployment for a High-Availability (HA) web application, incorporating best practices in security and
delivery through Continuous Integration/Continuous Deployment (CI/CD).

## Requirements

Ensure that the following prerequisites are met:

- Terraform installed (version 1.6.X)
- Kubernetes CLI (kubectl) installed
- FluxCD CLI installed
- Access to the AWS cloud provider

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

## Roadmap

- Additional browser support

- Add more integrations

## Authors

- [@maggnus](https://www.github.com/maggnus)


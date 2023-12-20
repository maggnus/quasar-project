.PHONY: deploy

init:
	@echo "Terraform init..."
	@terraform init

plan:
	@echo "Terraform plan..."
	@terraform plan

apply:
	@echo "Terraform apply..."
	@terraform apply

destroy:
	@echo "Terraform destroy..."
	@terraform destroy

config:
	@echo "Configure asses to the EKS cluster..."
	@aws eks update-kubeconfig --region ap-southeast-1 --name eks-1-quasar-dev
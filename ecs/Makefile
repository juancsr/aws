.PHONY: plan tfenv-install

tfenv-install:
	@echo "Installing Terraform version $(shell cat .terraform-version)"
	@tfenv install $(shell cat .terraform-version)
	@tfenv use $(shell cat .terraform-version)

init:
	@echo "Initializing Terraform..."
	@terraform init

plan:
	@echo "Planning Terraform changes..."
	@terraform plan


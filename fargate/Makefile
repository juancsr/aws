.PHONY: tf-install

tf-install:
	tfenv install

init:
	terraform init

clean-init:
	rm -rf .terraform
	rm -rf .terraform.lock.hcl
	terraform init

plan:
	terraform plan

auto-apply:
	terraform apply -auto-approve

format:
	terraform fmt

destroy:
	terraform destroy
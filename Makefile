EC2:
	cd ec2 && terraform plan -var-file dev.tfvars

RDS:
	cd rds && terraform plan -var-file dev.tfvars

run:
   docker-compose run --rm  make RDS && make ec2
# Запуск

Аутентификация (перед запуском):

```bash
yc config profile create sa-test
yc config set service-account-key "/Users/k/Homespace/arch-course/architecture-course-future/Task1Advanced/secrets/authorized_key.json"
export YC_TOKEN=$(yc iam create-token)
```

### dev

```bash
cd envs/dev
terraform init
terraform plan  -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

### stage

```bash
cd envs/stage
terraform init
terraform plan  -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

### prod

```bash
cd envs/prod
terraform init
terraform plan  -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

Удаление окружения:

```bash
terraform destroy -var-file=terraform.tfvars
```

module "security_groups" {
    source = "../module/"

# terraform.tfvars에 있는 값을 variablr.tf 파일에 설정된 쪽으로 주입?
    region = var.region

    current_region = var.current_region

    account_id = var.account_id

    current_id = var.current_id

    prefix = var.prefix

    name = var.name

    vpc_id = var.vpc_id

    tags = var.tags

    rules = var.rules





}
data "aws_vpc" "vpc" {
    id = var.vpc_id
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc
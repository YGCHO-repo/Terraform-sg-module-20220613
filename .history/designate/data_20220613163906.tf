data "aws_vpc" "vpc" {
    filter {
      name = 
      values = [ "value" ]
    }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc
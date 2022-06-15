data "aws_vpc" "vpc" {
    filter {
      name = "tag.Name"
      values = [ "var.name" ]
    }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc
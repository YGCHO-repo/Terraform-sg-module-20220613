data "aws_vpc" "vpc_id" {
    filter {
      name = "tag.Name"
      # values = [ "${var.name}" ]
      values = ["test-vpc"]
    }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc

/* data "aws_vpc" "vpc_id" {
    id = data.aws_vpc.vpc.id
} */
resource "null_resource" "validate_account" {
  count = var.current_id == var.account_id ? 0 : "Please check that you are using the AWS account"
  # 정수로 숫자를 확인 하는데~ 그 값은 current_id == account_id 값이 동일하다면 true 를 반환
  # true
}

resource "null_resource" "validate_module_name" {
  count = local.module_name == var.tags["TerraformModuleName"] ? 0 : "Please check that you are using the Terraform module"
  # 해당 값을 반환함. module_name    = "terraform-aws-module-security-groups"
  # false
}

resource "null_resource" "validate_module_version" {
  count = local.module_version == var.tags["TerraformModuleVersion"] ? 0 : "Please check that you are using the Terraform module"
  # 해당 값을 반환함. module_version = "v1.0.4"
  # Tag 값에 TerraformModuleVersion 가 있으면 True 이고, 아니면 False
}

resource "aws_security_group" "this" {
  name = format("%s-%s-security-groups", var.prefix, var.name)
  # terraform.tfvars 파일에서 설정한 값을 주입 해서 입력 
  # test-ygcho-sg-security-groups

  vpc_id = var.vpc_id

  depends_on = [
    null_resource.validate_account
  ]
  # validate_account 값이 참인 경우

  tags = merge(var.tags, tomap({Name = format("%s-%s-security-groups", var.prefix, var.name)}))
  # test-ygcho-sg-security-group
}


#resource "aws_security_group_rule" "default_ingress" {
#  type              = "ingress"
#  from_port         = 0
#  to_port           = 0
#  protocol          = "-1"
#  self              = true
#  security_group_id = aws_security_group.this.id
#}

#resource "aws_security_group_rule" "default_egress" {
#  type              = "egress"
#  to_port           = 0
#  protocol          = "-1"
#  from_port         = 0
#  cidr_blocks       = ["0.0.0.0/0"]
#  security_group_id = aws_security_group.this.id
#}

#resource "aws_security_group_rule" "self" {
#  security_group_id        = aws_security_group.this.id
#  for_each                 = { for k, v in local.self_to_rules : k => v }
#  type                     = each.value["type"]
#  from_port                = each.value["from_port"]
#  to_port                  = each.value["to_port"]
#  protocol                 = each.value["protocol"]
#  prefix_list_ids          = each.value["prefix_list_ids"]
#  description              = each.value["description"]
#  self                     = each.value["self"] 
#
#  depends_on = [
#    aws_security_group.this
#  ]
#
#  lifecycle {
#    create_before_destroy = true
#  }
#}
#
#resource "aws_security_group_rule" "cidr" {
#  security_group_id = aws_security_group.this.id
#  for_each          = { for k, v in local.cidr_to_rules : k => v }
#  type              = each.value["type"]
#  from_port         = each.value["from_port"]
#  to_port           = each.value["to_port"]
#  protocol          = each.value["protocol"]
#  cidr_blocks       = each.value["cidr_blocks"]
#  ipv6_cidr_blocks  = each.value["ipv6_cidr_blocks"]
#  prefix_list_ids   = each.value["prefix_list_ids"]
#  description       = each.value["description"]
#
#  depends_on = [
#    aws_security_group.this
#  ]
#
#  lifecycle {
#    create_before_destroy = true
#  }
#}
#
#resource "aws_security_group_rule" "security_group_id" {
#  security_group_id        = aws_security_group.this.id
#  for_each                 = { for k, v in local.security_group_id_to_rules : k => v }
#  type                     = each.value["type"]
#  from_port                = each.value["from_port"]
#  to_port                  = each.value["to_port"]
#  protocol                 = each.value["protocol"]
#  source_security_group_id = each.value["source_security_group_id"]
#  prefix_list_ids          = each.value["prefix_list_ids"]
#  description              = each.value["description"]
#
#  depends_on = [
#    aws_security_group.this
#  ]
#
#  lifecycle {
#    create_before_destroy = true
#  }
#}

#resource "aws_security_group_rule" "this" {
#  for_each                 = { for k, v in var.rules : k => v }
#  # Required
#  security_group_id        = aws_security_group.this.id
#  type                     = each.value["type"]
#  from_port                = each.value["from_port"]
#  to_port                  = each.value["to_port"]
#  protocol                 = each.value["protocol"]
#  # Optional
#  cidr_blocks              = length(each.value["cidr_blocks"]) > 0 ? each.value["cidr_blocks"] : []
#  ipv6_cidr_blocks         = length(each.value["ipv6_cidr_blocks"]) > 0 ? each.value["ipv6_cidr_blocks"] : []
#  source_security_group_id = substr(each.value["source_security_group_id"], 0, 3) == "sg-" ? each.value["source_security_group_id"] : ""
#  prefix_list_ids          = length(each.value["prefix_list_ids"]) > 0 ? each.value["prefix_list_ids"] : []
#  description              = length(each.value["description"]) > 0 ? each.value["description"] : ""
#  self                     = each.value["self"]
#
#  depends_on = [
#    aws_security_group.this
#  ]
#
#  lifecycle {
#    create_before_destroy = true
#  }
#}

resource "aws_security_group_rule" "self" {
  security_group_id        = aws_security_group.this.id
  for_each                 = { for i in local.self_to_rules : i.name => i }
  type                     = each.value.type
  from_port                = each.value.from_port
  to_port                  = each.value.to_port
  protocol                 = each.value.protocol
  prefix_list_ids          = each.value.prefix_list_ids
  description              = each.value.description
  self                     = each.value.self 

  depends_on = [
    aws_security_group.this
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "cidr" {
  security_group_id = aws_security_group.this.id
  for_each          = { for i in local.cidr_to_rules : i.name => i }
  type              = each.value.type
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  ipv6_cidr_blocks  = each.value.ipv6_cidr_blocks
  prefix_list_ids   = each.value.prefix_list_ids
  description       = each.value.description

  depends_on = [
    aws_security_group.this
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "security_group_id" {
  security_group_id        = aws_security_group.this.id
  for_each                 = { for i in local.security_group_id_to_rules : i.name => i }
  type                     = each.value.type
  from_port                = each.value.from_port
  to_port                  = each.value.to_port
  protocol                 = each.value.protocol
  source_security_group_id = each.value.source_security_group_id
  prefix_list_ids          = each.value.prefix_list_ids
  description              = each.value.description

  depends_on = [
    aws_security_group.this
  ]

  lifecycle {
    create_before_destroy = true
  }
}
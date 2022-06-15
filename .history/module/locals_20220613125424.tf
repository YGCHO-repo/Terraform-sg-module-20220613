locals {
  module_name    = "terraform-aws-module-security-groups"
  module_version = "v1.0.4"
}

# cidr_blocks, ipv6_cidr_blocks 와 source_security_group_id 함께 사용할 수 없음
# self가 true 일 경우, cidr_blocks, ipv6_cidr_blocks, source_security_group_id 사용할 수 없음
# designate 에서는 오브젝트 하나로 처리하지만, 모듈에서는 locals와 flatten함수를 이용해 분리
#locals {
#  cidr_to_rules = flatten([
#    for key, value in var.rules : {
#      type             = value.type
#      from_port        = value.from_port
#      to_port          = value.to_port
#      protocol         = value.protocol
#      cidr_blocks      = value.cidr_blocks
#      ipv6_cidr_blocks = value.ipv6_cidr_blocks
#      prefix_list_ids  = value.prefix_list_ids
#      description      = value.description
#    } if ( length(value.cidr_blocks) > 0 || length(value.ipv6_cidr_blocks) > 0 ) && value.self == false
#  ])
#}
#
#locals {
#  security_group_id_to_rules = flatten([
#    for key, value in var.rules : {
#      type                     = value.type
#      from_port                = value.from_port
#      to_port                  = value.to_port
#      protocol                 = value.protocol
#      source_security_group_id = value.source_security_group_id
#      prefix_list_ids          = value.prefix_list_ids
#      description              = value.description
#    } if value.source_security_group_id != "" && value.self == false
#  ])
#}
#
#locals {
#  self_to_rules = flatten([
#    for key, value in var.rules : {
#      type                     = value.type
#      from_port                = value.from_port
#      to_port                  = value.to_port
#      protocol                 = value.protocol
#      prefix_list_ids          = value.prefix_list_ids
#      description              = value.description
#      self                     = value.self
#    } if value.self == true
#  ])
#}

locals {
  cidr_to_rules = flatten([
    for key, value in var.rules : {
      name             = key
      type             = value.type
      from_port        = value.from_port
      to_port          = value.to_port
      protocol         = value.protocol
      cidr_blocks      = value.cidr_blocks
      ipv6_cidr_blocks = value.ipv6_cidr_blocks
      prefix_list_ids  = value.prefix_list_ids
      description      = value.description
    } if ( length(value.cidr_blocks) > 0 || length(value.ipv6_cidr_blocks) > 0 || length(value.prefix_list_ids) > 0 ) && value.self == false
  ])
}

locals {
  security_group_id_to_rules = flatten([
    for key, value in var.rules : {
      name                     = key
      type                     = value.type
      from_port                = value.from_port
      to_port                  = value.to_port
      protocol                 = value.protocol
      source_security_group_id = value.source_security_group_id
      prefix_list_ids          = value.prefix_list_ids
      description              = value.description
    } if value.source_security_group_id != "" && value.self == false
  ])
}

locals {
  self_to_rules = flatten([
    for key, value in var.rules : {
      name                     = key
      type                     = value.type
      from_port                = value.from_port
      to_port                  = value.to_port
      protocol                 = value.protocol
      prefix_list_ids          = value.prefix_list_ids
      description              = value.description
      self                     = value.self
    } if value.self == true
  ])
}
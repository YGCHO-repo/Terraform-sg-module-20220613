region = "ap-northeast-2"
# AWS Region
# string
# Region 설정값 입력

current_region = "ap-northeast-2"
# Your AWS current region
# string

account_id = "123456789123"
# Allowed AWS account ID
# string
# 12자리 AWS 플랫폼 사용 번호

current_id = "123456789123"
# Your current account id
# string

prefix = "test"
# prefix for aws resources and tags
# string

name = "test-sg"
# security group's name
# string

vpc_id = data.aws_vpc.vpc.id
# vpc id
# string
# 기존 AWS VPC ID값을 date로~

tags = {
    "key1" = "value1",
    "key2" = "value2",
    "key3" = "value3",
    "key4" = "value4"
}
# tag map
# map(string)

rules = 
# security group's rules
# map(any)
    


#  type = map(object({
#    type                      = string
#    from_port                 = string
#    to_port                   = string
#    protocol                  = string
#    cidr_blocks               = list(string)
#    ipv6_cidr_blocks          = list(string)
#    source_security_group_id  = string
#    prefix_list_ids           = list(string)
#    description               = string
#    self                      = bool
#  }))
#}

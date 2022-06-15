region = "ap-northeast-2"
# Region 설정값 입력

current_region = "ap-northeast-2"

account_id = "123456789123"
# 12자리 AWS 플랫폼 사용 번호

current_id = "123456789012"

prefix = "test"

name = "ygcho-sg"

vpc_id = data.aws_vpc.vpc.id
# 기존 AWS VPC ID값을 date로~

tags = {
    "key1" = "value1",
    "key2" = "value2",
    "key3" = "value3",
    "key4" = "value4"
}
# tag map
# map(string)

rules = {
    bastion = {

    },
    web = {

    },
    was ={

    },
    rds ={
        
    }

}
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

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
        type                      = "ingress"
        from_port                 = 22
        to_port                   = 22
        protocol                  = "tcp"
        cidr_blocks               = list(string)
        ipv6_cidr_blocks          = []
        source_security_group_id  = ""
        prefix_list_ids           = list(string)
        description               = string
        self                      = bool
    },
    web = {
        type                      = "ingress"
        from_port                 = 80
        to_port                   = 80
        protocol                  = "tcp"
        cidr_blocks               = list(string)
        ipv6_cidr_blocks          = []
        source_security_group_id  = ""
        prefix_list_ids           = list(string)
        description               = string
        self                      = bool
    },
    was ={
        type                      = "ingress"
        from_port                 = 8080
        to_port                   = 8080
        protocol                  = "tcp"
        cidr_blocks               = list(string)
        ipv6_cidr_blocks          = []
        source_security_group_id  = ""
        prefix_list_ids           = list(string)
        description               = string
        self                      = bool
    },
    rds ={
        type                      = "ingress"
        from_port                 = 3306
        to_port                   = 3306
        protocol                  = "tcp"
        cidr_blocks               = list(string)
        ipv6_cidr_blocks          = []
        source_security_group_id  = ""
        prefix_list_ids           = list(string)
        description               = string
        self                      = bool
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
#    ipv6_cidr_blocks          = []
#    source_security_group_id  = ""
#    prefix_list_ids           = list(string)
#    description               = string
#    self                      = bool
#  }))
#}

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
    jump = {
        type                      = "ingress"
        from_port                 = 22
        to_port                   = 22
        protocol                  = "tcp"
        cidr_blocks               = ["10.5.0.0/16"]
        ipv6_cidr_blocks          = []
        source_security_group_id  = ""
        prefix_list_ids           = []
        description               = "bastion server sg"
        self                      = true
    },
    web = {
        type                      = "ingress"
        from_port                 = 80
        to_port                   = 80
        protocol                  = "tcp"
        cidr_blocks               = ["10.5.0.0/16"]
        ipv6_cidr_blocks          = []
        source_security_group_id  = ""
        prefix_list_ids           = []
        description               = "web server sg"
        self                      = true
    },
    was ={
        type                      = "ingress"
        from_port                 = 8080
        to_port                   = 8080
        protocol                  = "tcp"
        cidr_blocks               = ["10.5.0.0/16"]
        ipv6_cidr_blocks          = []
        source_security_group_id  = ""
        prefix_list_ids           = []
        description               = "was server sg"
        self                      = true
    },
    rds ={
        type                      = "ingress"
        from_port                 = 3306
        to_port                   = 3306
        protocol                  = "tcp"
        cidr_blocks               = ["10.5.0.0/16"]
        ipv6_cidr_blocks          = []
        source_security_group_id  = ""
        prefix_list_ids           = []
        description               = "rds database server sg"
        self                      = true
    }

}
# security group's rules
# map(any)



#variable "rules" {
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
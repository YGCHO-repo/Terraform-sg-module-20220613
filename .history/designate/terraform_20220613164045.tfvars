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

vpc_id = data.aws_vpc
# vpc id
# string
# 기존 AWS VPC ID값을 date로~

tags = 
# tag map
# map(string)

rules = 
# security group's rules
# map(any)


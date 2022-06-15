variable "region" {
  description = "AWS Region"
  type = string
}

variable "current_region" {
  description = "Your AWS current region"
  type = string
}

variable "account_id" {
  description = "Allowed AWS account ID"
  type = string
}

variable "current_id" {
  description = "Your current account id"
  type = string
}

variable "prefix" {
  description = "prefix for aws resources and tags"
  type = string
}

variable "name" {
  description = "security group's name"
  type = string
  default = ""
}

variable "vpc_id" {
  description = "vpc id"
  type = string
}

variable "tags" {
  description = "tag map"
  type = map(string)
}

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

variable "rules" {
  description = "security group's rules"
  type        = map(any)
}
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # 암시적 표현 : registry.terraform.io/hashicorp/aws 가 진짜 소스값
      version = "4.18.0"
      # 현재 최신 Version 
    }
  }
}


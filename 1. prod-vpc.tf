## terraform 버전 및 Provider 정의 ##
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.43.0"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "ap-northeast-2"
}

## VPC 생성 ##
resource "aws_vpc" "Co-AN2-PRD-VPC" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"

  tags = {
    Name = "co-an2-prd-vpc"
  }
}

## PRD 퍼블릭 서브넷 A 생성 ##
resource "aws_subnet" "Co-AN2-AZa-PRD-SBN-PUB" {
  vpc_id            = aws_vpc.Co-AN2-PRD-VPC.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "co-an2-aza-prd-sbn-pub"
  }
}

## PRD 퍼블릭 서브넷 C 생성 ##
resource "aws_subnet" "Co-AN2-AZc-PRD-SBN-PUB" {
  vpc_id            = aws_vpc.Co-AN2-PRD-VPC.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "co-an2-azc-prd-sbn-pub"
  }
}

## PRD 프라이빗 WEB 서브넷 A 생성 ##
resource "aws_subnet" "Co-AN2-AZa-PRD-SBN-PRI-WEB" {
  vpc_id            = aws_vpc.Co-AN2-PRD-VPC.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "co-an2-aza-prd-sbn-pri-web"
  }
}

## PRD 프라이빗 WEB 서브넷 C 생성 ##
resource "aws_subnet" "Co-AN2-AZc-PRD-SBN-PRI-WEB" {
  vpc_id            = aws_vpc.Co-AN2-PRD-VPC.id
  cidr_block        = "10.0.7.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "co-an2-azc-prd-sbn-pri-web"
  }
}

# ## PRD 프라이빗 WAS 서브넷 A 생성 ##
# resource "aws_subnet" "Co-AN2-AZa-PRD-SBN-PRI-WAS" {
#   vpc_id            = aws_vpc.Co-AN2-PRD-VPC.id
#   cidr_block        = "10.0.11.0/24"
#   availability_zone = "ap-northeast-2a"

#   tags = {
#     Name = "co-an2-aza-rpd-sbn-pri-was"
#   }
# }

# ## PRD 프라이빗 WAS 서브넷 C 생성 ##
# resource "aws_subnet" "Co-AN2-AZc-PRD-SBN-PRI-WAS" {
#   vpc_id            = aws_vpc.Co-AN2-PRD-VPC.id
#   cidr_block        = "10.0.12.0/24"
#   availability_zone = "ap-northeast-2c"

#   tags = {
#     Name = "co-an2-aza-rpd-sbn-pri-was"
#   }
# }

## PRD 프라이빗 DB 서브넷 A 생성 ##
resource "aws_subnet" "Co-AN2-AZa-PRD-SBN-PRI-DB" {
  vpc_id            = aws_vpc.Co-AN2-PRD-VPC.id
  cidr_block        = "10.0.16.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "co-an2-aza-prd-sbn-pri-db"
  }
}

## PRD 프라이빗 DB 서브넷 C 생성 ##
resource "aws_subnet" "Co-AN2-AZc-PRD-SBN-PRI-DB" {
  vpc_id            = aws_vpc.Co-AN2-PRD-VPC.id
  cidr_block        = "10.0.17.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "co-an2-azc-prd-sbn-pri-db"
  }
}

# tfstate를 저장할 backend 설정
terraform {
  backend "local" {
  path = "state/terraform.tfstate"
  }
}
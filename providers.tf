terraform {
  required_version = ">= 0.13"
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "~> 1.93"
    }
  }
}

variable "access_key" {}
variable "secret_key" {}

provider "alicloud" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = "cn-hangzhou"
}

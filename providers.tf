variable "access_key" {}
variable "secret_key" {}

provider "alicloud" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = "cn-hangzhou"
  version    = "~> 1.92"
}

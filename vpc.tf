resource "alicloud_vpc" "test" {
  name              = "test"
  cidr_block        = "172.16.0.0/12"
  resource_group_id = var.rg
}

resource "alicloud_vswitch" "test" {
  vpc_id            = alicloud_vpc.test.id
  cidr_block        = "172.16.8.0/21"
  availability_zone = "cn-hangzhou-h"
}

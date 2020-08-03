resource "alicloud_security_group" "test" {
  resource_group_id = var.rg
  name              = "test"
  vpc_id            = alicloud_vpc.test.id
}

resource "alicloud_security_group_rule" "allow_ssh" {
  type              = "ingress"
  ip_protocol       = "tcp"
  cidr_ip           = "0.0.0.0/0"
  port_range        = "22/22"
  security_group_id = alicloud_security_group.test.id
}

resource "alicloud_eip" "test" {
  resource_group_id    = var.rg
  bandwidth            = "5"
  internet_charge_type = "PayByTraffic"
}

data "alicloud_images" "debian_10" {
  owners = "self"
  name_regex = "^debian-10$"
}

resource "alicloud_instance" "test" {
  resource_group_id = var.rg
  availability_zone = "cn-hangzhou-h"
  security_groups   = [alicloud_security_group.test.id]

  instance_type    = "ecs.t5-lc2m1.nano"
  system_disk_size = 20
  image_id         = data.alicloud_images.debian_10.images.0.id
  instance_name    = "test"
  vswitch_id       = alicloud_vswitch.test.id
  key_name         = alicloud_key_pair.test.key_name
}

resource "alicloud_eip_association" "test" {
  allocation_id = alicloud_eip.test.id
  instance_id   = alicloud_instance.test.id
}

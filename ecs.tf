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

resource "alicloud_instance" "test" {
  resource_group_id = var.rg
  availability_zone = "cn-hangzhou-h"
  security_groups   = [alicloud_security_group.test.id]

  instance_type    = "ecs.t5-lc2m1.nano"
  system_disk_size = 40
  image_id         = "ubuntu_18_04_64_20G_alibase_20190624.vhd"
  instance_name    = "test"
  vswitch_id       = alicloud_vswitch.test.id
  key_name         = alicloud_key_pair.test.key_name
}

resource "alicloud_eip_association" "test" {
  allocation_id = alicloud_eip.test.id
  instance_id   = alicloud_instance.test.id
}

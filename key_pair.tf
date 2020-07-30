resource "alicloud_key_pair" "test" {
  resource_group_id = var.rg
  key_name          = "test"
  public_key        = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQ..."
}

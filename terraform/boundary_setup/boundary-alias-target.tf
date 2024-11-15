
resource "boundary_alias_target" "ssh_alias_target" {
  name                      = "ssh_aws_my_app"
  description               = "Example alias to target my app using host boundary_host_static.bar"
  scope_id                  = "global"
  value                     = "my.app.boundary"
  destination_id            = boundary_target.ssh_foo.id
}


resource "boundary_alias_target" "ssh_alias_target" {
  name                      = "ssh_aws_my_app"
  description               = "Example alias to target my app using host boundary_host_static.bar"
  scope_id                  = "global"
  value                     = "my.app.boundary"
  destination_id            = boundary_target.ssh_foo.id
  authorize_session_host_id = boundary_host_set_plugin.aws_host_set_demo.id
}

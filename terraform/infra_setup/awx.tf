####### inventory #######
resource "awx_inventory" "default" {
  name            = "terraform-demo"
  organization    = "2"
}

######## Add Hosts to inventory ########
resource "awx_inventory_host" "boundary" {
  count        = length(aws_instance.boundary_instance)
  name         = "boundary-${count.index}"
  description  = "boundary-${count.index}"
  instance_id  = resource.aws_instance.boundary_instance[count.index].id
  inventory_id = resource.awx_inventory.default.id
  enabled   = true
  variables = <<YAML
---
ansible_host: ${resource.aws_instance.boundary_instance[count.index].public_dns}
YAML
}

######## kick of provision job ######
resource "awx_job_template_launch" "boundary" {
    depends_on = [ awx_inventory_host.boundary ]
    job_template_id = "9"
    inventory_id = resource.awx_inventory.default.id
}

terraform {
  required_version = ">= 0.12"
}

resource "lxd_container" "test1" {
  name      = "test1"
  image     = "ubuntu:18.04"
  ephemeral = false

  config = {
    "security.privileged" = true
  }
}

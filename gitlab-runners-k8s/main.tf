terraform {
  required_version = ">= 0.12"
}

resource "lxd_container" "k8s-master" {
  name      = "k8s-master"
  image     = "ubuntu:18.04"
  ephemeral = false

  config = {
    "security.privileged" = true
  }

  limits = {
    cpu    = "2"
    memory = "1024MB"
  }
}

resource "lxd_container" "node-1" {
  name      = "node-1"
  image     = "ubuntu:18.04"
  ephemeral = false

  config = {
    "security.privileged" = true
  }

  limits = {
    cpu    = "2"
    memory = "1024MB"
  }
}

resource "lxd_container" "node-2" {
  name      = "node-2"
  image     = "ubuntu:18.04"
  ephemeral = false

  config = {
    "security.privileged" = true
  }

  limits = {
    cpu    = "2"
    memory = "1024MB"
  }
}

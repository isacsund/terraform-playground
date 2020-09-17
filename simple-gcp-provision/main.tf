terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
        }
    }
}

provider "google" {
    version = "3.5.0"

    credentials = file("credentials.json")

    project = "fifth-legacy-289816"
    region = "europe-west1"
    zone = "europe-west1-b"
}

variable "instance_name_input" {
    type = string
}

resource "google_compute_instance" "vm_instance" {
    name = var.instance_name_input
    machine_type = "f1-micro"

    boot_disk {
        initialize_params {
            image = "ubuntu-1804-lts"
        }
    }

    network_interface {
        network = "default"
        access_config {
        }
    }
}

output "instance_name" {
    value = google_compute_instance.vm_instance.name
}

output "public_ip" {
    value = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
}

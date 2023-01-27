terraform {
    required_providers {
      google = {
          source = "hashicorp/google"
      }
    }
    backend "gcs" {
      bucket    = "burntroll-terraform"
      prefix    = "terraform/state"
    }
}

provider "google" {
  project = "analog-foundry-369807"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
}
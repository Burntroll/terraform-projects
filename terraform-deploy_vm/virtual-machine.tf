resource "google_compute_instance" "terraform" {
    project         = "INSERT-PROJECT-ID"
    name            = "terraform"
    machine_type    = "n1-standard-1"
    zone            = "us-central1-b"
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
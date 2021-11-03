provider "google" {

project     = "midevops"
region      = "us-central1"

}

resource "google_compute_attached_disk" "first-disk" {
  disk     =  "disk-1"
  instance =  "test01"
  project     = "midevops"
  zone         = "us-central1-a"
}

resource "google_compute_instance" "first-vm" {
  name         = "test01"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
         // Ephemeral public IP

         
       }
     }


     metadata_startup_script = "echo hi > /test.txt"



         lifecycle {
    ignore_changes = ["attached_disk"]
}
       }

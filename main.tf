provider "google" {

project     = "midevops"


}

resource "google_compute_instance" "first-vm" {
  name         = "test01"
  machine_type = "f1-micro"
  zone         = "us-west4-b"
  
  

boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  
  attached_disk {
    source = "projects/midevops/zones/us-west4-b/disks/apollo-home"
  }

  network_interface {
    network = "default"

    access_config {
         // Ephemeral public IP

         
       }
     }

metadata = {
    startup-script-url = "gs://tfstate-midevops/startupscripts/scripts.sh"
    startup_script = "echo hi > /test.txt"
  }
       }

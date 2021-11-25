provider "google" {

project     = "midevops"


}

resource "google_compute_instance" "first-vm" {
  name         = "test01"
  machine_type = "f1-micro"
  zone         = "us-west4-b"
  
  metadata = {
    startup-script-url = "gd://tfstate-midevops/startupscripts/scripts.sh"
  }

boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  
  attached_disk {
    source = "projects/midevops/zones/us-west4-b/disks/test01"
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

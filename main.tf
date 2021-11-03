provider "google" {

project     = "my-project-id"
region      = "us-central1"

}

resource "google_compute_attached_disk" "default" {
  disk     =  disk-1
  instance =  test01
}

resource "google_compute_instance" "default" {
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

   //  service_account {
   //      # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
   //      email  = 584230291121-compute@developer.gserviceaccount.com
   //      scopes = ["cloud-platform"]

         lifecycle {
    ignore_changes = [attached_disk]
}
      
  }

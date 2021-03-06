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
  //    startup_script = "sudo apt-get install lvm2 -y"  //  startup_script =  "./Scripts/startup.sh"  //  startup-script =  file("./Scripts/startup.sh")
  
 //  startup-script = <<SCRIPT
   //    ${file("${path.module}/Scripts/startup.sh")}
   //      ${file("${path.module}/Scripts/output.sh")}
   //     SCRIPT
//    startup_script =    "./Scripts/output.sh"
// startup_script =  file("${path.module}/Scripts/output.sh")
 
    startup-script-url =  "gs://tfstate-midevops/startupscripts/scripts.sh"
                           
                            
           }
 
    }

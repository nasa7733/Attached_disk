provider "google" {

project     = "midevops"
region      = "us-central1"

}
resource "google_compute_attached_disk" "first-disk" {
  disk     =  "apollo-data"
  device_name =  "apollo-data"
  instance =  "test01"
  project     = "midevops"
  zone         = "us-west4-b"
}

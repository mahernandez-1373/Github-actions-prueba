terraform {
  backend "gcs" {
    bucket  = "terraform-remote-state-315589"
    prefix  = "terraform/statefile"
  }
}

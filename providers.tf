terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.34.0"
    }
    google-beta = {
      source = "hashicorp/google-beta"
      version = "5.34.0"
    }
  }
}

provider "google" {
  credentials = file("clave.json")
  project     = "abstract-aloe-426819-i2"
  region      = "us-central1"
}

provider "google-beta" {
  credentials = file("clave.json")
  project     = "abstract-aloe-426819-i2"
  region      = "us-central1"
}

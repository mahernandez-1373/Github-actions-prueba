################################################################################
# GCP Postgres module
################################################################################
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

module "pg" {
  source  = "terraform-google-modules/sql-db/google//modules/postgresql"

  name                 = var.pg_ha_name
  random_instance_name = var.pg_random_instance_name
  project_id           = var.pg_project_id
  database_version     = var.pg_database_version
  region               = var.pg_region

  // Master configurations
  tier                            = var.pg_tier
  zone                            = var.pg_zone
  availability_type               = var.pg_availability_type

  deletion_protection = var.pg_deletion_protection

  user_labels = {
    env   = "prod"
    owner = "developers"
  }


  db_name      = var.pg_ha_name
  db_charset   = var.pg_db_charset
  db_collation = var.pg_db_collation

  user_name     = var.pg_user_name
  user_password = var.pg_user_password
}


resource "google_sql_database" "mydatabase" {
  name     = "pg-database"
  instance = module.pg.instance_name
}
################################################################################
# VPC Module
################################################################################


################################################################################
# Cloud SQL Module GCP
################################################################################
module "pg" {
  source = "./modules/cloud-sql"

  pg_ha_name          = "postgres_db"
  pg_project_id       = "abstract-aloe-426819-i2"
  pg_database_version = "POSTGRES_9_6"
  pg_region           = "us-central1"

  pg_tier              = "db-custom-1-3840"
  pg_zone              = "us-central1-c"
  pg_availability_type = "ZONAL"

  pg_user_name      = "user"
  pg_user_password  = "password"

}

################################################################################
# Cloud Run
################################################################################

/*resource "google_cloud_run_service" "api_service" {
  name     = "data-api"
  location = "us-central1" 

  template {
    spec {
      containers {
        image = "gcr.io/abstract-aloe-426819-i2/data-api:latest"
          env {
            name  = "DB_HOST"
            value = 
        }
        env {
          name  = "DB_NAME"
          value = google_sql_database.default.name
        }
        env {
          name  = "DB_USER"
          value = google_sql_user.root.name
        }
        env {
          name  = "DB_PASS"
          value = google_sql_user.root.password
        }
        ports {
          container_port = 8080
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}*/

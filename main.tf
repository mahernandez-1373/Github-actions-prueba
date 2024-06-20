################################################################################
# VPC Module
################################################################################


################################################################################
# Cloud SQL Module GCP
################################################################################
resource "google_sql_database_instance" "main" {
  name             = "postgres-instance"
  database_version = "POSTGRES_15"
  region           = "us-central1"

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "db-f1-micro"
  }
}

/*module "pg" {
  source = "./modules/cloud-sql"

  pg_ha_name          = "postgres-db"
  pg_project_id          = "algo"
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

resource "google_cloud_run_service" "api_service" {
  name     = "data-api"
  location = "us-central1" 

  template {
    spec {
      containers {
        image = "gcr.io/your-project-id/data-api:latest"

        // Configuración para recibir eventos de Pub/Sub
        env {
          name  = "SUBSCRIPTION"
          value = google_pubsub_subscription.data_subscription.name
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}*/

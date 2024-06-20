################################################################################
# GCP Pub sub topic
################################################################################
resource "google_pubsub_topic" "data-topic" {
  name = "data-ingest-topic"

  labels = {
    owner = "dev"
  }

  message_retention_duration = "86600s"
}

################################################################################
# GCP Pub sub subcription
#########################################################################

resource "google_pubsub_subscription" "data-subscription" {
  name  = "data-ingest-subscription"
  topic = google_pubsub_topic.data-topic.id

  ack_deadline_seconds = 20

  labels = {
    owner = "dev"
  }

  push_config {
    push_endpoint = "https://example.com/push"

    attributes = {
      x-goog-version = "v1"
    }
  }
}
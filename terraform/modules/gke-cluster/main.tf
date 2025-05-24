terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region       # us‑central1
}

resource "google_container_cluster" "primary" {
  name       = var.cluster_name          # demo‑cluster
  location   = var.region                # must be a region for Autopilot
  project    = var.project_id

  enable_autopilot   = true
  deletion_protection = false

  # ✂️  DO NOT include node_config or initial_node_count in Autopilot

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }
}
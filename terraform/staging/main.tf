provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}

module "gke_cluster" {
  source       = "../modules/gke-cluster"
  cluster_name = "demo-cluster"
  env_name     = "staging"
  region       = var.region
  project_id   = var.project_id
}
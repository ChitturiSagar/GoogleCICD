variable "cluster_name" {
  description = "Name of the GKE cluster."
  type        = string
}

variable "env_name" {
  description = "Environment (staging or production)."
  type        = string
}

variable "region" {
  description = "GCP region to deploy the cluster."
  type        = string
  default     = "us-central1"
}

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}
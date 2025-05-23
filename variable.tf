variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
}

variable "region" {
  description = "The region where resources will be deployed"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The zone within the region for Composer worker nodes"
  type        = string
  default     = "us-central1-a"
}

variable "composer_env_name" {
  description = "The name of the Cloud Composer environment"
  type        = string
  default     = "nyc-taxi-composer-env"
}

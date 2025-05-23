terraform {
  required_version = ">= 1.3"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Create Cloud Composer environment
resource "google_composer_environment" "composer_env" {
  name   = var.composer_env_name
  region = var.region

  config {
    node_config {
      zone         = var.zone
      machine_type = "n1-standard-2"
    }

    software_config {
      image_version = "composer-2.1.5-airflow-2.6.3"
      env_variables = {
        AIRFLOW__CORE__DAGS_ARE_PAUSED_AT_CREATION = "false"
        AIRFLOW__CORE__LOAD_EXAMPLES               = "false"
      }
    }
  }
}

# Create BigQuery dataset for raw taxi data
resource "google_bigquery_dataset" "raw_dataset" {
  dataset_id = "raw_nyc_taxi"
  location   = var.region
}

# Create BigQuery dataset for curated/processed taxi data
resource "google_bigquery_dataset" "curated_dataset" {
  dataset_id = "curated_nyc_taxi"
  location   = var.region
}

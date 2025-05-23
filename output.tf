output "composer_environment_name" {
  value       = google_composer_environment.composer_env.name
  description = "Name of the Cloud Composer environment"
}

output "composer_environment_uri" {
  value       = google_composer_environment.composer_env.config.0.airflow_uri
  description = "Airflow web UI URI for the Composer environment"
}

output "raw_dataset_id" {
  value       = google_bigquery_dataset.raw_dataset.dataset_id
  description = "BigQuery dataset ID for raw NYC taxi data"
}

output "curated_dataset_id" {
  value       = google_bigquery_dataset.curated_dataset.dataset_id
  description = "BigQuery dataset ID for curated NYC taxi data"
}

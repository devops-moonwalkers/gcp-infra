terraform {
  backend "gcs" {
    bucket = "devops-temp-statebucket"
    prefix = "state"
  }
}

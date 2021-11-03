terraform {
  backend "gcs" {
    bucket = "devops-temp-statebucket-sonja"
    prefix = "state"
  }
}

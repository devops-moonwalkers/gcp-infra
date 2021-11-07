terraform {
  backend "gcs" {
    bucket = "devops-temp-statebucket-monica"
    prefix = "state"
  }
}

terraform {
  backend "gcs" {
    bucket = "devops-moonwalkers-testbucket"
    prefix = "state"
  }
}

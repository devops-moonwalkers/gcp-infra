terraform {
  required_providers { 
    google = {
      source  = "hashicorp/google"
      version = "~> 3.70.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 3.70.0"
    }
  }
}

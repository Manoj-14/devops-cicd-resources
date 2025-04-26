terraform {
  backend "s3" {
    bucket = "terraformstatemanm"
    key    = "terraform/backend" // bacically foldername(which folder we need to save)
    region = "us-east-1"
  }
}

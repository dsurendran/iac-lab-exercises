terraform {
  backend "s3" {
    bucket = "dsuren-iac-lab-tfstate"
    key    = "state_file"
    region = "ap-south-1"

    dynamodb_table = "dsuren-iac-lab-tfstate-locks"
    encrypt        = true
  }
}

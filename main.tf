terraform {
  # Live modules pin exact Terraform version; generic modules let consumers pin the version.
  # The latest version of Terragrunt (v0.36.0 and above) recommends Terraform 1.1.4 or above.
  required_version = "= 1.1.4"

  # Live modules pin exact provider version; generic modules let consumers pin the version.
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.7.0"
    }
  }
}


# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE S3 OBJECT
# ---------------------------------------------------------------------------------------------------------------------
data "aws_s3_bucket" "devs3bucket" {
  bucket = "t468644devs3"
}



resource "aws_s3_object" "object" {
  bucket = data.aws_s3_bucket.devs3bucket.id
  key    = var.file_name
  source = "devtest"
  tags    = var.tags
  

}

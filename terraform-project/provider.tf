terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  backend "s3" {
      bucket = "terraformbucketz"
      key    = "terraform/backup_state.tfstate"
      region = "us-west-2"
      access_key = "XXXXXXXXXXXXXXXXXXXXXXXXX"
      secret_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXX"
    }
}

provider "aws" {
  profile = "default"
  region  = var.region
  access_key = var.access_key
  secret_key = var.secret_key


}
resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = "ExampleAppServerInstance"
  }
}



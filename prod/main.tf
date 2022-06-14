provider "aws" {
    access_key = "AKIAUCIQY2UCHM3SFNKV"
    secret_key = "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"
    region     = "us-east-1"
  
}

module "team_vpc" {
    source      = "../modules/vpc"
    vpc_cidr    = "192.168.0.0/16"
    tenancy     = "default"
    vpc_id      = "${module.team_vpc.vpc_id}"
    subnet_cidr =  "192.168.1.0/24"
}


module "team_ec2" {
  source    = "../modules/ec2"
  ec2_count = "1"
  ami_id    = "ami-0022f774911c1d690"
  instance_type = "t2.micro"
  subnet_id     = "${module.team_vpc.subnet_id}"

}
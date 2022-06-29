Skip to content
Search or jump to…
Pull requests
Issues
Marketplace
Explore
 
@borysyuk 
borysyuk
/
terraform-aws-tftest
Private
forked from irakravchuk/terraform-aws-tftest
Code
Pull requests
Actions
Projects
Security
Insights
Settings
terraform-aws-tftest/22/mod/main.tf
@irakravchuk
irakravchuk Update main.tf
Latest commit a671821 on Mar 27, 2020
 History
 1 contributor
165 lines (144 sloc)  3.09 KB

provider "aws" {
  region     = var.region
  #access_key = "${var.scalr_aws_access_key}"
  #secret_key = "${var.scalr_aws_secret_key}" 
}
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
  }
resource "aws_instance" "test_instanceIK" { 
  #count = 160
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = "subnet-41b49e24"
  associate_public_ip_address = var.associate_public_ip
  tags = merge({ "Name" = format("irak-tf-test -> %s -> %s", data.aws_ami.ubuntu.name, timestamp()) }, var.tags)
  #key_name   = "deployer-key-${count.index}"
  
  
  #tags = merge({ "Name" = "i.kravchuk"}, var.tags)
}


variable "region" {
  type = string
  default = "us-east-1"
}

variable "instance_type" {
  type = string
  default = "t2.nano"
}

variable "network" {
  type = string
  default = "vpc-596aa03e"
}

variable "subnet" {
  type = string
  description = "Test input description"
  default = "subnet-3d82d101"
}
#variable "subnet" {
 # type = list(list(string))
  #description = "Test input description"
  #default = [["subnet-3d82d101", "subnet-b347fefb", "subnet-7e3fd71a"]]
#}


variable "associate_public_ip" {
  type    = bool
  default = true
  
}

variable "tags" {
   type = "map"
   default = {
   us-east-1 = "image-1234"
   us-west-2 = "image-4567"
 }
}
#variable "scalr_aws_access_key" {
 #type = string
 #}

#variable "scalr_aws_secret_key" {
 #type = string
 #}
variable "test_instanceIK_22" {
 type = string
 default = "1"
 }
variable "test_instanceIK" {
 type = string
 description = "Test input description"
 default = "foo"
 }
 #type = string
  #description = "Test input description"
  #default = [["gfggf", "jhvghjg"], ["subnet-3d82d101", "subnet-b347fefb", "subnet-7e3fd71a"]]
 #default =  ["subnet-3d82d101"["subnet-b347fefb"("subnet-7e3fd71a")]]
 #}

variable "ira-tags" {
 type = map(list(string))
 description = "Test input description"
 default = { foo = [ "bar" ] }
} 

variable "vpc_cidrs_public" {
  type    = "list"
  default = ["10.139.1.0/24", "10.139.2.0/24", "10.139.3.0/24",]
}


#variable "text_var" {
 #type = string
 #default = null
#}
#variable "json_var" {
  #type = list  
 #type = list(list(string))
#}
#variable "list_var" {
 #type = list 
#}
#variable "HIDE" {
 # type = string
 # }
variable "ik" {
  type = string
  default = "5"
 #type = list(list(string))
}
variable "tags1" {
   type = "map"
   default = {
   us-east-1 = "image-1234"
   us-west-2 = "image-4567"
 }
}
variable "tags2" {
   type = "map"
   default = {
   us-east-1 = "image-1234"
   us-west-2 = "image-4567"
 }
}
variable "tags3" {
   type = "map"
   default = {
   us-east-1 = "image-1234"
   us-west-2 = "image-4567"
 }
}
variable "tags4" {
   type = "map"
   default = {
   us-east-1 = "image-1234"
   us-west-2 = "image-4567"
 }
}



#variable "sg" {
#description = "AWS Secruity Group"
 # type = list
#}


variable "instance_count" {
  type = any
  default = "1"
}
© 2022 GitHub, Inc.
Footer navigation
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About

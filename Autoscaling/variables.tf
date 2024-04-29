#Variable used to specify AMI used for instances in the ASG
variable "ami" {
  description = "ami of ec2 instance"
  type        = string
  default     = "ami-04e5276ebb8451442"
}

# Launch Template and ASG Variables
variable "instance_type" {
  description = "launch template EC2 instance type"
  type        = string
  default     = "t2.micro"
}

#Variable used to filter marketplace AMIs to select Amazon Linux AMI
variable "ami_filter" {
  description = "Name filter and owner for AMI"   

  type = object ({
    name  = string
    owner = string
  })

  default = {
  name  = "al2023-ami-2023.4.20240416.0-kernel-6.1-x86_64"
  owner = "137112412989"
  }
}

#This user data variable indicates that the script configures Apache on a server.
variable "ec2_user_data" {
  description = "variable indicates that the script configures Apache on a server"
  type        = string
  default     = <<EOF
#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
EOF
}

# VPC Variables
variable "vpc_cidr" {
  description = "VPC cidr block"
  type        = string
  default     = "10.10.0.0/16"
}

#These Public subnets are used for resources that need to be accessible from the internet
variable "public_subnet_cidr" {
  description = "Public Subnet cidr block"
  type        = list(string)
  default     = ["10.10.0.0/24", "10.10.2.0/24"]
}

#Environement variable, specifying name if the environment
variable "environment" {
  description = "Environment name for deployment"
  type        = string
  default     = "ASG-Terraform"
}

#Region Variable
variable "aws_region" {
  description = "AWS region name"
  type        = string
  default     = "us-east-1"
}

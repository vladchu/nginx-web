variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "instance_ami" {
  description = "EC2 instance AMI"
  type        = string
  default     = "ami-0ecb62995f68bb549"
}

variable "ssh_key_name" {
  description = "Name of your AWS SSH key pair"
  type        = string
  default     = "usa"
}

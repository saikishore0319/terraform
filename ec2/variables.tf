variable "aws_instance_type" {
    default = "t2.micro"
    type = string
}

variable "aws_ami_id" {
    default = "ami-0f918f7e67a3323f0"
    type = string
}

variable "aws_default_dev_volume_size" {
    default = 8
    type = number
}
variable "aws_default_prod_volume_size" {
    default = 15
    type = number
}


variable "env" {
    default = "production"
    type = string
}

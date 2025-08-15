module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "terrafrom-module-instance"

  instance_type = var.aws_instance_type
  ami = "ami-0f918f7e67a3323f0"
  vpc_security_group_ids = ["sg-09b7e1f1b50e7638a"]
  key_name      = "terra-key"
#   monitoring    = true
    # region = "ap-south-1a"
  subnet_id     = "subnet-0dafac32c5df8db6b"
  associate_public_ip_address = true

  root_block_device = {
    type = "gp3"
    size = 10
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
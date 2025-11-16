module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  for_each = {
    ec2a = module.vpc.private_subnets[0]
    ec2b = module.vpc.private_subnets[1]
  }
  name = each.key
  

  instance_type = "t2.micro"
  key_name      = "terra-key"
#   monitoring    = true
  subnet_id     = each.value
  vpc_security_group_ids = [module.web_server_sg.this_security_group_id]
  # associate_public_ip_address = true
  ami = "ami-0f918f7e67a3323f0"

  root_block_device = {
    type = "gp3"
    size = 10
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
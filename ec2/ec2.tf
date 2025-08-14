#key pair
resource "aws_key_pair" "deployer" {
  key_name = "${var.env}-my_key"
  public_key = file("my_key.pub")
}

# resource "aws_key_pair" "existing_key" {
#     key_name = "stripe-app"

#     lifecycle {
#       ignore_changes = [public_key]
#     }
# }


#vpc
resource "aws_default_vpc" "default" {
  
}

#security groups
resource "aws_security_group" "my_security_group" {
    name = "automate_sg"
    description = "this is a terraform generated security group"
    vpc_id = aws_default_vpc.default.id
    
    #inbound rules
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
        description = "ssh open"
    }
    
    #inbound rules
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
        description = "http open"
    }

    #outbound rules
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = [ "0.0.0.0/0" ]
        description = "allow all "
    }
}

#ec2 instance
resource "aws_instance" "tf_instance" {
    # count = 2
    for_each = tomap({
        tf_server_micro = "t2.micro"
        # tf_server_medium = "t2.medium"
    })
    depends_on = [ aws_security_group.my_security_group ] #instance wont be created before the security group
    key_name = aws_key_pair.deployer.key_name
    security_groups = [ aws_security_group.my_security_group.name ]
    instance_type = each.value
    ami = var.aws_ami_id
    user_data = file("nginx.sh")

    root_block_device {
      volume_size = var.env == "production" ? var.aws_default_prod_volume_size : var.aws_default_dev_volume_size
      volume_type = "gp3"
    }

    tags = {
        Name = each.key
    }
}

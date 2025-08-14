# output "ec2_public_dns" {
#   value = aws_instance.tf_instance[*].public_dns
# }

# output "ec2_public_ip" {
#   value = aws_instance.tf_instance[*].public_ip
# }


output "ec2_public_ip" {
  value = [
    for instances in aws_instance.tf_instance : instances.public_ip
  ]
}
output "ec2_public_dns" {
  value = [
    for instances in aws_instance.tf_instance : instances.public_dns
  ]
}
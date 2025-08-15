output "public-ip" {
  value = [
    for instances in values(module.ec2_instance) : instances.public_ip
  ]
}

output "public-dns" {
  value = [
    for instances in values(module.ec2_instance) : instances.public_dns
  ]
}
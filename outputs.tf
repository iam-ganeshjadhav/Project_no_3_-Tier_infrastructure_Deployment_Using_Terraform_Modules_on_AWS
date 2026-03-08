output "web_public_ip" {
  value = module.ec2.web_public_ip
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}
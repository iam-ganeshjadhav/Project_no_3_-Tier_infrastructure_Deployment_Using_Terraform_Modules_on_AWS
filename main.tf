module "vpc" {
  source = "./modules/vpc"
}

module "ec2" {
  source = "./modules/ec2"

  vpc_id         = module.vpc.vpc_id
  public_subnet  = module.vpc.public_subnet
  private_subnet = module.vpc.private_subnet1
  key_name       = var.key_name
}

module "rds" {

  source = "./modules/rds"

  vpc_id = module.vpc.vpc_id

  private_subnet1 = module.vpc.private_subnet1
  private_subnet2 = module.vpc.private_subnet2

}
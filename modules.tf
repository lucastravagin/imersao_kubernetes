module "network" {

    source = "./modules/network"
    
    cluster_name = var.cluster_name
    aws_region = var.aws_region
    
}

module "master" {

    source = "./modules/master"
    
    cluster_name = var.cluster_name
    aws_region = var.aws_region

    vpc_cluster = module.network.vpc_cluster
    
    private_subnet_2a = module.network.private_subnet_2a
    private_subnet_2c = module.network.private_subnet_2c
    
}
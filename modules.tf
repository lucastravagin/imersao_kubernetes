module "network" {

  source = "./modules/network"

  cluster_name = var.cluster_name
  aws_region   = var.aws_region

}

module "master" {

  source = "./modules/master"

  cluster_name = var.cluster_name
  aws_region   = var.aws_region

  vpc_cluster = module.network.vpc_cluster

  private_subnet_2a = module.network.private_subnet_2a
  private_subnet_2c = module.network.private_subnet_2c

}

module "nodes" {
    
 
  source = "./modules/nodes"

  cluster_name = var.cluster_name
  aws_region   = var.aws_region

  eks_cluster         = module.master.eks_cluster
  eks_cluster_sg      = module.master.security_group

  private_subnet_2a   = module.network.private_subnet_2a

  private_subnet_2c   = module.network.private_subnet_2c

  vpc_cluster = module.network.vpc_cluster

  auto_scale_options = var.auto_scale_options

  nodes_instances_sizes = var.nodes_instances_sizes


}

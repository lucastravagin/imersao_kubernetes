variable "cluster_name" {
  default = "eks-cluster"
}

variable "aws_region" {
  default = "us-east-2"
}


variable "nodes_instances_sizes" {
  default = [
    "t3.large"
  ]
}

variable "auto_scale_options" {
  default = {
    min     = 2
    max     = 10
    desired = 2
  }
}

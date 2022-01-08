resource "aws_subnet" "private_subnet_2a" {
  
  vpc_id = aws_vpc.vpc_cluster.id
  cidr_block = "10.0.32.0/20"

  
  availability_zone = format("%sa", var.aws_region)

  tags = {
    Name = format("%s-private-2a", var.cluster_name)
    Terraform = "true"
  }

}

resource "aws_subnet" "private_subnet_2c" {
  
  vpc_id = aws_vpc.vpc_cluster.id
  cidr_block = "10.0.48.0/20"

  
  availability_zone = format("%sc", var.aws_region)

  tags = {
    Name = format("%s-private-2c", var.cluster_name)
    Terraform = "true"
  }

}
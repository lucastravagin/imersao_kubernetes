resource "aws_subnet" "public_subnet_2a" {
  
  vpc_id = aws_vpc.vpc_cluster.id
  cidr_block = "10.0.0.0/20"

  map_public_ip_on_launch = true

  availability_zone = format("%sa", var.aws_region)

  tags = {
    Name = format("%s-public-2a", var.cluster_name)
    Terraform = "true"
  }

}


resource "aws_subnet" "public_subnet_2c" {
  
  vpc_id = aws_vpc.vpc_cluster.id
  cidr_block = "10.0.16.0/20"

  map_public_ip_on_launch = true

  availability_zone = format("%sc", var.aws_region)

  tags = {
    Name = format("%s-public-2c", var.cluster_name)
    Terraform = "true"
  }
}

resource "aws_route_table_association" "public_2a" {
  subnet_id = aws_subnet.public_subnet_2a.id
  route_table_id = aws_route_table.igw_route_table.id
}

resource "aws_route_table_association" "public_2c" {
  subnet_id = aws_subnet.public_subnet_2c.id
  route_table_id = aws_route_table.igw_route_table.id
}


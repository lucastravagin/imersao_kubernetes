resource "aws_eip" "vpc_eip" {
  vpc = true
  tags = {
    Name      = format("%s-eip", var.cluster_name)
    Terraform = "true"
  }
}

resource "aws_nat_gateway" "nat" {

  allocation_id = aws_eip.vpc_eip.id
  subnet_id     = aws_subnet.public_subnet_2a.id

  tags = {
    Name      = format("%s-nat-gateway", var.cluster_name)
    Terraform = "true"
  }

}

resource "aws_route_table" "nat" {

  vpc_id = aws_vpc.vpc_cluster.id

    tags = {
    Name = format("%s-private-route", var.cluster_name)
    Terraform = "true"
  }
}

resource "aws_route" "nat_access" {
  route_table_id = aws_route_table.nat.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat.id
}

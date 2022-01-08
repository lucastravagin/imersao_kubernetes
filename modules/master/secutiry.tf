resource "aws_security_group" "cluster_master_sg" {

  name        = format("%s-master-sg", var.cluster_name)

  description = "Permitir trafego de saida para "
  vpc_id      = var.vpc_cluster.id


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  tags = {
    Name      = format("%s-public-route", var.cluster_name)
    Terraform = "true"
  }

}


resource "aws_security_group_rule" "cluster_ingress_https" {
  cidr_blocks      = ["0.0.0.0/0"]
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.cluster_master_sg.id

}

resource "aws_security_group_rule" "cluster_ingress_http" {
  cidr_blocks      = ["0.0.0.0/0"]
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.cluster_master_sg.id
  
}
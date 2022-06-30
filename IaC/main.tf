resource "aws_security_group" "this" {
  name = "Allow_Apps"
  description = "Permitir principais portas dos apps"
  vpc_id = data.aws_vpc.selected.id

    ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    local.tags_padrao,
    {
    nivel-permissao = "allow_tls"
  },
  )
}
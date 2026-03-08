resource "aws_db_subnet_group" "db_subnet" {

  name = "db-subnet-group"

  subnet_ids = [
    var.private_subnet1,
    var.private_subnet2
  ]
}

resource "aws_security_group" "db_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "mysql" {

  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"

  username = "admin"
  password = "password123"

  db_subnet_group_name = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]

  skip_final_snapshot = true
}
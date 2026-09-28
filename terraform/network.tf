resource "aws_vpc" "quiz_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_subnet" "quiz_subnet" {
  vpc_id                  = aws_vpc.quiz_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-subnet"
  }
}

resource "aws_internet_gateway" "quiz_igw" {
  vpc_id = aws_vpc.quiz_vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

resource "aws_route_table" "quiz_route_table" {
  vpc_id = aws_vpc.quiz_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.quiz_igw.id
  }

  tags = {
    Name = "${var.project_name}-route-table"
  }
}

resource "aws_route_table_association" "quiz_route_association" {
  subnet_id      = aws_subnet.quiz_subnet.id
  route_table_id = aws_route_table.quiz_route_table.id
}
# Find the latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux" {

  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


# Create an AWS key pair using our public SSH key
resource "aws_key_pair" "quiz_key" {

  key_name = "${var.project_name}-key"

  public_key = file(
    pathexpand("~/.ssh/id_ed25519.pub")
  )
}


# Kubernetes control-plane server
resource "aws_instance" "control_plane" {

  ami = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  subnet_id = aws_subnet.quiz_subnet.id

  vpc_security_group_ids = [
    aws_security_group.quiz_sg.id
  ]

  key_name = aws_key_pair.quiz_key.key_name

  associate_public_ip_address = true

  tags = {
    Name = "${var.project_name}-control-plane"
    Role = "control-plane"
  }
}


# Kubernetes worker server
resource "aws_instance" "worker" {

  ami = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  subnet_id = aws_subnet.quiz_subnet.id

  vpc_security_group_ids = [
    aws_security_group.quiz_sg.id
  ]

  key_name = aws_key_pair.quiz_key.key_name

  associate_public_ip_address = true

  tags = {
    Name = "${var.project_name}-worker"
    Role = "worker"
  }
}
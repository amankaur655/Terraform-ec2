# Generates a secure private k ey and encodes it as PEM
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
# Create the Key Pair
resource "aws_key_pair" "ec2_key" {
  key_name   = "week10-key"  
  public_key = tls_private_key.ec2_key.public_key_openssh
}
# Save file
resource "local_file" "ssh_key" {
  filename = "week10-key.pem"
  content  = tls_private_key.ec2_key.private_key_pem
}


resource "aws_instance" "ec2-one" {
  ami = "ami-01eccbf80522b562b"
  vpc_security_group_ids = [aws_security_group.ec2.id]
  subnet_id = aws_subnet.private_subnet1.id
   user_data = file ("userdata.sh")
  key_name = "week10-key"
  instance_type = "t2.micro"
  tags={
    Name = "webserver-1"
  }
}

resource "aws_instance" "ec2-two" {
  ami = "ami-01eccbf80522b562b"
  vpc_security_group_ids = [aws_security_group.ec2.id]
  subnet_id = aws_subnet.private_subnet2.id
  user_data = file ("userdata.sh")
  key_name = "week10-key"
  instance_type = "t2.micro"
  tags={
    Name = "webserver-2"
  }
}
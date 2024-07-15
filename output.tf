

output "vpc_id" {
    value = aws_vpc.vpc1
}

output "ec2_sg_id"{
    value = aws_security_group.ec2.id
}

output "alb_sg_id"{
    value = aws_security_group.lb.id
}

output "ec2_instance_1_id" {
    value = aws_instance.ec2-one.id
}

output "ec2_instance_2_id" {
    value = aws_instance.ec2-two.id
}

output "public_subnet_1_id" {
  value = aws_subnet.public_subnet1.id
}

output "public_subnet_2_id" {
  value = "aws_subnet.public_subnet2.id"
}

output "private_subnet_1_id" {
  value       = aws_subnet.private_subnet1.id
}

output "private_subnet_2_id" {
  value       = aws_subnet.private_subnet2.id
}
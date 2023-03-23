output "vpc_id" {
  value = aws_vpc.nameofvpc.id
}

output "subnet_id" {
  value = aws_subnet.nameofsubnet.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.nameofigw.id
}

output "route_table_id" {
  value = aws_route_table.nameofroutetable
}

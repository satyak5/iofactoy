resource "aws_eip" "nat" {
 vpc      = true
}

resource "aws_nat_gateway" "gw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.prod-subnet-public-1.id}"

  tags = {
    Name = "gw NAT"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
    name = "${var.common.env}-${var.common.project}-nat-gw"
    subnet_id = var.subnet_id
    allocation_id = var.allocation_id // provide Elastic IP
}

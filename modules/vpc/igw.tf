resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.project}-${var.env}-${local.region_short}-igw"
    Project     = var.project
    Environment = var.env
    Terraform   = "true"
  }
}

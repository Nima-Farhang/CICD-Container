
resource "aws_s3_bucket" "ecr_bucket" {
  bucket        = "landing-bucket-${var.environment}-${var.account_id}"
  force_destroy = true

  tags = {
    Name        = "landing-bucket-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_s3_object" "stage" {
  bucket = aws_s3_bucket.ecr_bucket.id
  key    = "stage/"
}


resource "aws_s3_object" "warehouse" {
  bucket = aws_s3_bucket.ecr_bucket.id
  key    = "warehouse/"
}
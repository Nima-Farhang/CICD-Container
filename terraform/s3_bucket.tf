# Creates an S3 bucket for ECR-related storage, with force_destroy enabled for easy cleanup.
resource "aws_s3_bucket" "ecr_bucket" {
  bucket        = "ecr-bucket-${var.environment}-${var.account_id}"
  force_destroy = true

  tags = {
    Name        = "ecr-bucket-${var.environment}"
    Environment = var.environment
  }
}

# Adds a "stage/" folder (object) to the ECR bucket.
resource "aws_s3_object" "stage" {
  bucket = aws_s3_bucket.ecr_bucket.id
  key    = "stage/"
}

# Creates a landing S3 bucket, also with force_destroy for cleanup.
resource "aws_s3_bucket" "landing_bucket" {
  bucket        = "landing-bucket-${var.environment}-${var.account_id}"
  force_destroy = true

  tags = {
    Name        = "landing-bucket-${var.environment}"
    Environment = var.environment
  }
}

# Adds a "landing/" folder (object) to the landing bucket.
resource "aws_s3_object" "landing" {
  bucket = aws_s3_bucket.landing_bucket.id
  key    = "landing/"
}
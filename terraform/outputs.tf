output "ecr_bucket" {
  value = aws_s3_bucket.ecr_bucket.bucket
}


output "ecr_bucket_url" {
  value = aws_s3_bucket.ecr_bucket.bucket_domain_name
}

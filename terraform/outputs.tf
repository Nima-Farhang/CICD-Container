output "ecr_bucket" {
  value = aws_s3_bucket.ecr_bucket.bucket
}


output "ecr_bucket_url" {
  value = aws_s3_bucket.ecr_bucket.bucket_domain_name
}


output "ecr_repository_url" {
  value = aws_ecr_repository.ecr_repo.repository_url
}
output "ecr_bucket" {
  value = aws_s3_bucket.ecr_bucket.bucket
}


output "ecr_bucket_url" {
  value = aws_s3_bucket.ecr_bucket.bucket_domain_name
}


output "ecr_repository_url" {
  value = aws_ecr_repository.ecr_repo.repository_url
}


output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "ecs_cluster_arn" {
  value = aws_ecs_cluster.main.arn
}
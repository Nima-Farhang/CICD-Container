resource "aws_ecs_cluster" "main" {
  name = "ecs-cluster-${var.environment}-${var.account_id}"

  tags = {
    Name        = "ecs-cluster-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_ecs_cluster_capacity_providers" "main" {
  cluster_name       = aws_ecs_cluster.main.name
  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = 1
    base              = 0
  }
}

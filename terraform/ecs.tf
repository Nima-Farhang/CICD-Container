resource "aws_ecs_cluster" "ecs" {
  name = "ecs-cluster-${var.environment}-${var.account_id}"

  tags = {
    Name        = "ecs-cluster-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_ecs_cluster_capacity_providers" "ecs" {
  cluster_name       = aws_ecs_cluster.ecs.name
  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = 1
    base              = 0
  }
}

############################################
# CloudWatch Logs (so logs don't 404)
############################################
resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/ecs/ecs-app-${var.environment}"
  retention_in_days = 14
}

############################################
# ECS Task Definition (Fargate)
############################################
resource "aws_ecs_task_definition" "ecs_app" {
  family                   = "ecs-app-${var.environment}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.task_cpu
  memory                   = var.task_memory

  # Role that lets the agent pull images / push logs
  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn

  # Role that your application code uses (AWS SDK calls, etc.)
  task_role_arn = aws_iam_role.ecs_task_role.arn

  # Optional but recommended if you target ARM or specific OS
  # runtime_platform {
  #   operating_system_family = "LINUX"
  #   cpu_architecture        = "X86_64" # or "ARM64" if your image is ARM
  # }

  container_definitions = jsonencode([
    {
      name      = "ecs-app"
      image     = var.main_app_image_uri
      essential = true

      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
          protocol      = "tcp"
        }
      ]

      # Basic health check (tweak for your app)
      # healthCheck = {
      #   command     = ["CMD-SHELL", "curl -f http://localhost:${var.container_port}/ || exit 1"]
      #   interval    = 30
      #   timeout     = 5
      #   retries     = 3
      #   startPeriod = 10
      # }

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = aws_cloudwatch_log_group.ecs.name
          awslogs-region        = var.region
          awslogs-stream-prefix = "ecs"
        }
      }

      # Example env vars (delete if not needed)
      environment = [
        { name = "ENVIRONMENT", value = var.environment }
      ]
    }
  ])

  depends_on = [aws_cloudwatch_log_group.ecs]
}
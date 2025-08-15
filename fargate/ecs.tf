resource "aws_ecs_cluster" "example" {
  name = "fargate-example-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_cluster_capacity_providers" "example" {
  cluster_name = aws_ecs_cluster.example.name

  capacity_providers = ["FARGATE", "FARGATE_SPOT"]
}

resource "aws_ecs_task_definition" "service" {
  family = "nginx"
    requires_compatibilities = ["FARGATE"]
    network_mode = "awsvpc"
    cpu = "1024"
    memory = "3072"
  container_definitions = jsonencode([{
    name  = "nginx"
    image = "public.ecr.aws/nginx/nginx:latest"
    portMappings = [
      {
        containerPort = 80
        hostPort      = 80
        protocol      = "tcp"
      }
    ]
    cpu    = 1024
    memory = 3072

    environment = [{
      name  = "ENVIRONMENT"
      value = "AWS_Fargate"
    }]

  }])
  runtime_platform {
    cpu_architecture        = "X86_64"
    operating_system_family = "LINUX"
  }
}

resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_default_vpc.default.id
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# resource "aws_default_subnet" "default_az1" {
#   availability_zone = "us-east-1a"

#   tags = {
#     Name = "Default subnet for us-west-2a"
#   }
# }

# resource "aws_ecs_service" "example" {
#   name            = "nginx-service"
#   cluster         = aws_ecs_cluster.example.id
#   task_definition  = aws_ecs_task_definition.service.arn
#   desired_count   = 3

#   launch_type = "FARGATE"

#   load_balancer {
#     target_group_arn = aws_lb_target_group.test.arn
#     container_name   = "nginx"
#     container_port   = 80
#   }

#     network_configuration {
#       subnets = [
#         aws_default_subnet.default_az1.id
#       ]
#     }
#   depends_on = [aws_lb_target_group.test]
# }

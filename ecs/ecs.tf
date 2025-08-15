# Create the cluster
resource "aws_ecs_cluster" "example" {
  name = "ecs-demo-cluster"
}

# Creating a task definition
resource "aws_ecs_task_definition" "example" {
  family                   = "ecs-demo-task-definition"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "1024"
  memory                   = "3072"

  # Uncomment the following line if you have an execution role defined
  #   execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  ephemeral_storage {
    size_in_gib = 21
  }

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  container_definitions = jsonencode([{
    name  = "demo-container"
    image = "public.ecr.aws/ecs-sample-image/amazon-ecs-sample:latest"
    portMappings = [{
      containerPort = 80
      protocol      = "tcp"
    }]
  }])
}

# Creating a service (runs the task definition)
## default VPC and subnet
resource "aws_default_vpc" "default" {
}

## default subnet for us-east-1a
resource "aws_default_subnet" "default_az1" {
  availability_zone = "us-east-1a"

  tags = {
    Name = "Default subnet for us-west-2a"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow-tls-ecs-demo-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_default_vpc.default.id

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0" # Allow all IPv4 addresses
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

## Service definition
resource "aws_ecs_service" "example" {
  name            = "ecs-demo-service"
  cluster         = aws_ecs_cluster.example.id
  task_definition = aws_ecs_task_definition.example.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [aws_default_subnet.default_az1.id]
    security_groups  = [aws_security_group.allow_tls.id]
    assign_public_ip = true
  }
}
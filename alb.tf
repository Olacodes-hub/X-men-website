

resource "aws_lb" "application_load_balancer" {
  name               = "dev-alb"
  load_balancer_type = "application"
  internal = false
  security_groups = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.public_subnet_az1.id, aws_subnet.public_subnet_az2.id]  

  tags = {
    Name ="dev-alb"
  }
}

resource "aws_lb_target_group" "tg" {
  name     = "dev-tg"
  target_type = "instance"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id  

  health_check {
    path                = "/health"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 10
    healthy_threshold   = 3
    port = "traffic-port"
    unhealthy_threshold = 3
    }
}


resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn  = "arn:aws:acm:us-east-1:732025887430:certificate/fe172d4a-7b60-4928-99f7-91fa4a83be08"



  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "redirect"
    redirect {
      protocol      = "HTTPS"
      port          = "443"
      status_code   = "HTTP_301"
    }
  }
}
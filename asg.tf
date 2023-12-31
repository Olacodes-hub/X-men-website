# create a launch template
resource "aws_launch_template" "launch_template" {
  name                   = "dev-asg"
  image_id               = var.image_id                                                 # Replace with the desired AMI ID
  instance_type          = "t2.micro"                                                   # Replace with the desired instance type
  vpc_security_group_ids = [aws_security_group.ssh_sg.id, aws_security_group.alb_sg.id] # Replace with the desired security group ID(s)
  key_name               = var.my_key
  description            = "asg for launch template"
}

#create autoscaling group
resource "aws_autoscaling_group" "auto_sg" {
  vpc_zone_identifier = [aws_subnet.private_app_subnet_az1.id, aws_subnet.private_app_subnet_az1.id]
  name                = "dev-asg"
  min_size            = 1
  max_size            = 3
  desired_capacity    = 2
  health_check_type   = "ELB"

  launch_template {
    name    = aws_launch_template.launch_template.name
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "asg-webserver"
    propagate_at_launch = true
  }

  lifecycle {
    ignore_changes = [target_group_arns]
  }

}

# attach target group to autoscaling
resource "aws_autoscaling_attachment" "alb_target_group_attachment" {
  autoscaling_group_name = aws_autoscaling_group.auto_sg.name
  lb_target_group_arn    = aws_lb_target_group.tg.arn
}
resource "aws_launch_configuration" "launchconfig" {
name_prefix = "launchconfig"
image_id = "ami-2757f631"
instance_type = "t2.micro"
user_data     = "${file("./file/user_data.sh")}"
key_name = "main_key"
}

resource "aws_autoscaling_group" "autoscaling" {
name = "autoscaling"
vpc_zone_identifier = ["subnet-030089c5eff60ac6c","subnet-068636c25f51c2670"]
launch_configuration = "${aws_launch_configuration.launchconfig.name}"
min_size = 1
max_size = 2
health_check_grace_period = 300
health_check_type = "EC2"
force_delete = true
tag {
key = "Name"
value = "ec2 instance"
propagate_at_launch = true
}
}

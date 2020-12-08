resource "aws_launch_configuration" "example-launchconfig" {
  name_prefix          = "example-launchconfig"
  image_id             = lookup(var.AMIS, var.AWS_REGION)
  instance_type        = "t2.micro"
  key_name             = aws_key_pair.mykeypair.key_name
  security_groups      = [aws_security_group.myinstance.id]
  user_data            = "#!/bin/bash\napt-get update\napt-get -y install git wget net-tools curl nodejs npm mysql-client\nmkdir -p /var/www/html/\ncd /var/www/html/ && git clone https://github.com/karimfadl/Backend-Inventory-App-ExpressJs.git . && cp .env_example .env\nMYIP=`ifconfig | grep 'inet 10' | awk '{ print $2 }' | cut -d ':' -f2`\necho 'this is: '$MYIP > /var/www/html/index.html\nsed -i 's/DATABASE_HOST_ENV/${aws_db_instance.mariadb.endpoint}/g; s/DATABASE_USER_ENV/${var.RDS_USER}/g; s/DATABASE_NAME_ENV/${var.RDS_NAME}/g; s/DATABASE_PASSWORD_ENV/${var.RDS_PASSWORD}/g' /var/www/html/.env\nnpm install && node app.js"
  lifecycle              { create_before_destroy = true }
}

resource "aws_autoscaling_group" "example-autoscaling" {
  name                 = "example-autoscaling"
  vpc_zone_identifier  = [aws_subnet.main-public-1.id, aws_subnet.main-public-2.id]
  launch_configuration = aws_launch_configuration.example-launchconfig.name
  min_size             = 1
  max_size             = 4
  health_check_grace_period = 300
  health_check_type = "ELB"
  load_balancers = [aws_elb.my-elb.name]
  force_delete = true

  tag {
      key = "Name"
      value = "karim-fadl"
      propagate_at_launch = true
  }
}

resource "aws_instance" "my-test-instance" {
  ami                    = "ami-0d1bf5b68307103c2"
  instance_type          = "t2.micro"
  key_name               = "AWSS3_Instance_MayurAWS1"
  subnet_id              = aws_subnet.my-test-subnet.id
  vpc_security_group_ids = [aws_security_group.my-test-security-group.id]
  user_data              = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
    EOF
  tags = {
    "Name" = "myec2vm"
  }
}
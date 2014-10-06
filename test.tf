provider "aws" {
    access_key = "ACCESS_KEY_HERE"
    secret_key = "SECRET_KEY_HERE"
    region = "us-east-1"
}


resource "aws_instance" "ec2" {
    
    ami = "ami-408c7f28"
    instance_type = "t1.micro"
    private_ip = "10.0.2.101"
    subnet_id = "us-west-2a-test"
    iam_instance_profile = "my_profile"

    provisioner "local-exec" {
        command = "echo ${aws_instance.example.public_ip} > file.txt"
    }
}

resource "aws_launch_configuration" "as_conf" {
    name = "coreos_config"
    image_id = "ami-408c7f28"
    instance_type = "m1.small"
    iam_instance_profile = "test_profile"
}

resource "aws_instance" "instance1" {
    ami = "ami-057752b3f1d6c4d6c"
    key_name = "linuxkey"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
    tags= {
        Name  = "jenkins_instance"
    }
    user_data = <<-EOF
    #!/bin/bash
        sudo yum update –y
        sudo wget -O /etc/yum.repos.d/jenkins.repo \
        https://pkg.jenkins.io/redhat-stable/jenkins.repo
        sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
        sudo yum upgrade
        sudo amazon-linux-extras install java-openjdk11 -y
        sudo dnf install java-11-amazon-corretto -y
        sudo yum install jenkins -y
        sudo systemctl enable jenkins
        sudo systemctl start jenkins
        sudo systemctl status jenkins

    EOF
    user_data_replace_on_change = true
}


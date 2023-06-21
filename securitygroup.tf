resource "aws_security_group" "jenkins_sg" {
    name        = "jenkins_sg"
    description = "Open ports 22, 8080, and 443"
    ingress {
        description = "Incoming SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["14.102.91.34/32"]
    }
    ingress {
        description = "Incoming HTTP"
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["14.102.91.34/32"]
    }
    ingress {
        description = "Incoming HTTPS"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["14.102.91.34/32"]
    }
    egress {
        description = "Incoming SSH"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "jenkins_sg"
    }
}
 
resource "aws_security_group" "sg" {
  name        = "rabbitMQ"
  description = "Security Group"
  vpc_id      = var.vpc-id

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"] # add a CIDR block here
  }

  ingress {
    from_port   = 4369
    to_port     = 4369
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5672
    to_port     = 5672
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 15672
    to_port     = 15672
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 25672
    to_port     = 25672
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port       = 0
    to_port         = 0                              # keep this to 0 
    protocol        = "-1" # 6=TCP 1=ICMP 17=UDP     # And keep this to -1
    cidr_blocks     = ["0.0.0.0/0"]                 # for allowing all traffic 
                                                    # as set by default in AWS
  }
}
#!/bin/bash

ssh -i "/path/to/aws_ec2_linux_2.pem" ec2-user@ec2-13-238-120-200.ap-southeast-2.compute.amazonaws.com<<EOF
sudo -s bash  <<ROOT_SHELL
cat /etc/passwd
date
ROOT_SHELL
EOF





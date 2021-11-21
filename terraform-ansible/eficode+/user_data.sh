#!/bin/bash

sudo yum install -y amazon-linux-extras
sudo amazon-linux-extras install epel -y
sudo amazon-linux-extras enable epel
sudo yum update -y
sudo amazon-linux-extras install ansible2 -y
sudo amazon-linux-extras install ansible2 -y
sudo echo BACKEND_ENDPOINT="http://$(curl http://169.254.169.254/latest/meta-data/public-ipv4):9000/api" >> /home/ec2-user/.env
sudo echo "APPID=${APPID}" >> /home/ec2-user/.env
sudo echo "TARGET_CITY=${TARGET_CITY}"  >> /home/ec2-user/.env
sudo echo "MAP_ENDPOINT=${MAP_ENDPOINT}"  >> /home/ec2-user/.env
sudo echo "FRONTEND_HOST=${FRONTEND_HOST}"  >> /home/ec2-user/.env
sudo echo "BACKEND_PORT=${BACKEND_PORT}"  >> /home/ec2-user/.env
sudo echo "FRONTEND_PORT=${FRONTEND_PORT}"  >> /home/ec2-user/.env

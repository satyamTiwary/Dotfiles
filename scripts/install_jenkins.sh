#!/usr/bin/bash
# https://pkg.jenkins.io/debian-stable/
# https://askubuntu.com/questions/197564/how-do-i-add-a-line-to-my-etc-apt-sources-list

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee -a /etc/apt/sources.list

sudo apt-get update
sudo apt-get install jenkins

# pub   rsa4096 2020-03-30 [SC] [expires: 2023-03-30]
#       62A9756BFD780C377CF24BA8FCEF32E745F2C3D5
# uid                      Jenkins Project 
# sub   rsa4096 2020-03-30 [E] [expires: 2023-03-30]

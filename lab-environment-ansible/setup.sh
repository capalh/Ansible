#/bin/sh

# install necessary tools at CentOS

sudo yum install -y git vim gcc glibc-static telnet psmisc epel-release

# Enable PasswordAuthentication, username=vagrant, password=vagrant

sudo sed -i `s/PasswordAuthentication no/PasswordAuthentication yes/g` /etc/ssh/sshd_config
sudo systemctl restart sshd

# Install ansible 
         
sudo yum -y install ansible           

# Edit the /etc/hosts file

sudo sh -c "echo 192.168.200.11 master >> /etc/hosts"
sudo sh -c "echo 192.168.200.12 host-2 >> /etc/hosts"
sudo sh -c "echo 192.168.200.13 host-3 >> /etc/hosts"


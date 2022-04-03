# What's Ansible

A powerful automated deployment tool

### Prepare Ansible test environment

1. Deploy three Linux host - CentOSv7
2. Install Ansible - only on the master node

```
sudo yum -y install epel-release            # Install the dependency
sudo yum -y install ansible                 # Install ansible package
```
3. Configure the /etc/hosts file 

```
192.168.200.11 master
192.168.200.12 host-2
192.168.200.13 host-3
```

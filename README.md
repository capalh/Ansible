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

4. Use VSCode to sync the folder. Install the sftp plugin under VScode. 

Sample sftp.json file

```
{
    "name": "My Server",
    "host": "192.168.200.11",
    "protocol": "sftp",
    "port": 22,
    "username": "vagrant",
    "privateKeyPath": "/Users/labadmin/DevOps/ansible/.vagrant/machines/master/virtualbox/private_key",
    "remotePath": "/home/vagrant/ansible",
    "uploadOnSave": true
}

```


### Inventory 

The `Inventory` is used to define the list of the hosts

1. Make sure enabled `PasswordAuthentication` as `Yes`, change the settings `sudo vi /etc/ssh/sshd_config`, 
2. Restart the sshd servcie `sudo systemctl restart sshd.service`

A sample inventory file - Try to ping the host-2 using ansible

```
host-2  ansible_connection=ssh  ansible_user=vagrant    ansible_ssh_pass=vagrant
```
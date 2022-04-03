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

5. Enable the password authentication. Make sure enabled `PasswordAuthentication` as `Yes`, change the settings `sudo vi /etc/ssh/sshd_config`, 
6. Restart the sshd servcie `sudo systemctl restart sshd.service`


### Inventory 

The `Inventory` is used to define the list of the hosts

1. A sample inventory file - Try to ping the host-2 using ansible

```
host-2  ansible_connection=ssh  ansible_user=vagrant    ansible_ssh_pass=vagrant
```
Then run `ansible all -m ping -i inventory.ini`, got the response:

```
host-2 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
```

ping - the ping here is Ansible ping rather than TCP/IP ping
all - excute all hosts 

2. We can also specify a host for ping test `ansible host-3 -m ping -i inventory.ini`

```
$ ansible host-3 -m ping -i inventory.ini
host-3 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
```

3. Group of hosts, then `ansible web1 -m ping -i inventory.ini`, 

```
[web1]
host-2  ansible_connection=ssh  ansible_user=vagrant    ansible_ssh_pass=vagrant

[web2]
host-3  ansible_connection=ssh  ans  ible_user=vagrant    ansible_ssh_pass=vagrant
```
or using Regular expression

```
[web1]
host-[2:3]  ansible_connection=ssh  ansible_user=vagrant    ansible_ssh_pass=vagrant
```

4. Use SSH-key to auth. In real world, we don't want to input password in the inventory file

Step1: Use `ssh-keygen` to genreate key-pair
Step2: Use `ssh-copy-id -i ansible host-2` to copy the public key to the host-2 and host-3
Step3: Login use `ssh -i ~/.ssh/ansible host-2` without input password

```
ansible web1 -m ping -i inventory.ini --private-key=~/.ssh/ansible
```

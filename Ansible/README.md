# To run uptime for all the hosts in aws group
    ansible aws -a “/sbin/uptime”
    or
    ansible aws -a “/sbin/uptime” -u ec2-user

# Creating new directory
    ansible aws -m file -a “dest=/home/ec2-user/textfile1.txt mode=777 owner=ubuntu group=ubuntu state=directory”

# Deleting whole new directory
    ansible aws -m file -a “dest=/home/ec2-user/textfile1.txt state=absent”

# Managing Packages
    ansible aws -m yum -a “name=httpd state=present”
    ansible aws -m yum -a “name=httpd state=absent”
    ansible aws -m yum -a “name=httpd state=latest”

# Gathering Facts
    ansible all -a hostname
    ansible all -a setup

# Simple playbook to install and run httpd
```
---
- name: Setup httpd Server on EC2 hosts
  hosts: webserver
  become: “True”
  tasks:
  - name: Install httpd Server
    apt:
      name: httpd
      state: present

  - name: Copy index.html
    copy:
      src:
      dest: /var/www/html/index.html

  - name: Ensure httpd is running
    service:
      name: httpd
      state: started
  ```
      
# Creating roles for ansible
    ansible-galaxy init roles/name
# to run ansible playbook
    ansible-playbook -i [hostfile includess all ip address] -u [username] test.yml [.yml file]

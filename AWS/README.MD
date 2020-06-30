# Steps to setup tools to run the dynamic inventory
	1. sudo apt-get install -y python3.6
	2. sudo apt-get install -y python3-pip
	3. pip install ansible (if not installed already)
	4. pip install awscli boto boto3
# and, then run this command -
	ansible-inventory -i aws_ec2.yml --list
	
## Now, you will be good to work with Ansible AWS Dynamic Inventory

# Devops
it contains all the assignments for the Devops
        
# steps for all the step ups.

##
   1. Make sure to use the same .pem key for all 4 instances;
   its gets easier to create the slave nodes later on Jenkins.
  Otherwise you will need 4 different authentication key 
  verification.!	
       
## setting up Jenkins Master and Jennkins Slaves:
#
        create 4 AWS-ec2-instances:
        Jenkins Master
        DevSlave
        jenkins PROD
        jenkins QA
-----------------------------------------
##
        website for java: https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html
## Jenkins Master instance
```
You NEED to donwload JDK JAVA manually:
step one:
------------------------------------------------
#copy the .tar file from local to your instance.for windows user to copy file from local to ec2:
 $scp -i C:\Users\location\to\keyfile.pem C:\Users\location\to\jdk-8u251-linux-x64.tar.gz ec2-user@ip#:/tmp
 
Step 2:
	Log into ec2-user-master:

use root: 
        $ sudo -i
        $yum install git
        $ cd /opt/
        $ vim java-install.sh  
# this will create a shell script file easy steps to install java
 # copy this into the file by pressing  'i' to insert

 
----------------------------copy below----------------------------------------

        !/bin/bash
        cd /opt
        tar xvzf jdk-8u251-linux-x64.tar.gz
        cd jdk1.8.0_251/
        alternatives --install /usr/bin/java java /opt/jdk1.8.0_251/bin/java 2
        sudo alternatives --config java
----------------------------copy above----------------------------------------

#
        $ chmod u+x java-install.sh
        $ cp ./tmp/jdk-8u251-linux-x64.tar.gz  //copy the jdk from /tmp to /opt
        $./java-install.sh 
            select 1 --> /opt/jdk1.8.0_251/bin/java

-------------------java installation done-----------------------------
                   
  Now install jenkins;

-------------------jenkins installation-----------------------------
#
go to this website and pick your instance type; linux ubuntu ... 
       https://www.jenkins.io/download/ 

RedHat Linux RPM packages for Jenkins:

        run these commands:

                sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
                sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
    
after that:
           $ sudo yum install jenkins
            to start the server:
        $ sudo systemctl start jenkins or  $sudo service jenkins start
              (you can restart, stop the same way)
    now get your public ip for example: ip:8080 to run it on the web.
      
follow the step to get the authentication code/password: make sure to add 
                    $sudo cat /.../.../
        finish installation and it should run.
----------------------------------------------------------------------
```
## For the other 3 instances:
    follow the same procedure to install java and git but you dont 
    need to install jenkins. 
    Only master will have that. 
        
## Adding slave nodes on jenkins       
  
        ----step1:---
        click:
        step1: Manage jenkins
        Manage Credentials
        under stores scoped to 
        click jenkins
        Global Credentials
        on left ( Add Credentials)
        Kind: SSH Username with private key
        username: ec2-user
        private key: copy and paste it from the .pem key
        from local machine you can 
        cat aws.pem

        press ok

        -----step2----
        go to:
        Manage jenkins
        Manage Nodes and Clouds
        on left (New Node)
        Node name: DevSlave
        permanent Agent
 ------------------------
     
         Name-	  devslave
        Description- devslave:ip#
        # of executors-	1
        Remote root directory-	/var/lib/jenkins
        Labels-	jenkinsSlave
        Usage-Only build jobs with label expressions matching this node
        Launch method-	Launch agents via SSH
        Host-	ip number
        Credentials-	ec2-user (you created)
        Host Key Verification Strategy- Manually trusted key Verification Strategy
  ---------------------------------
#
        before click save we need to create a jenkins folder on /var/lib:
        terminal:
        go to the slave terminal:
        cd /var/lib
        sudo mkdir jenkins
        sudo chown ec2-user:ec2-user jenkins/
-----------------------------------------
##
        click save and it will run the node

        do the same but when creating click on : copy Existing Node and type in the first node name
        and change the ip for each nodes.
 -------------------------------------------------


#
```
        -----------TomCat installation--------------
        Apache Tomcat Installation Steps -
        1. sudo yum install tomcat
        2. sudo vi /usr/share/tomcat/conf/tomcat.conf
        JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xmx1026m -
        XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC"
        3. sudo yum install tomcat-webapps tomcat-admin-webapps
        4. sudo yum install tomcat-docs-webapp tomcat-javadoc
        5. sudo vi /usr/share/tomcat/conf/tomcat-users.xml
        <tomcat-users>
        <user username="admin" password="password" roles="manager-gui,admin-gui"/>
        6. sudo systemctl start tomcat
        -------------------------------------------------```

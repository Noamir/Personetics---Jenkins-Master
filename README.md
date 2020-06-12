Personetics-Jenkins-Master
This repository spins up Jenkins Master on a container with the required plugins to deploy <TBD>.

Requirements:
2 Linux servers
ssh connection is open between the servers with the following configurations:
- copy ~/.ssh/id_rsa.pub from Host A (Jenkins Master to be)
- Paste in ~/.ssh/authorized_keys in Host B (Deployment)

How to run:

1. git clone https://github.com/Noamir/Personetics-Jenkins-Master.git

2. Docker installation:
- ./docker-installation.sh

3. Jenkins master installation:
-  docker-compode up -d
- ./jenkins-configuration.sh

4. Jenkins master additional configurations: 
- connect to jenkins ui (unlock first time)
- configure extra permissions for running pipeline projects:
	- Navigate to jenkins > Manage jenkins > In-process Script Approval --> Approve scripts

5. Jenkins is ready to use, enjoy (:

COMMENTS:
1. The project in my server can be found under 
/home/ec2-user/jenkins-config 
/home/ec2-user/docker-installation.sh

2. In order to make '' project run i did the following changes:
1.1 add docker label
1.2 ansible inventory


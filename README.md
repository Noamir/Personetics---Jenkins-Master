**Personetics-Jenkins-Master**

This repository spins up Jenkins Master on a container with the required plugins to deploy a web app project from git, using Ansible.

Requirements:
- 2 Linux servers
- ssh connection is open between the servers with the following configurations:
  
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
	- login to jenkins UI (unlock first time)
	- configure extra permissions for running pipeline projects:
		- Navigate to jenkins > Manage jenkins > In-process Script Approval > Approve running scripts

5. Jenkins is ready to use, enjoy (:


ADDITIONAL NOTES:
1. The project in my server (3.248.208.196) can be found under: 
	- /home/ec2-user/jenkins-config 
	- /home/ec2-user/docker-installation.sh

2. In order to make 'demo' project run I made the following adjustments:

2.1 Jenkinsfile:

- removed label 'docker' from agent docker
- removed post stage for sending emails - SMTP error
	
2.2 Edited Ansible inventory file to contain:
  
	[web]
	10.1.210.172
	
	[web:vars]
	ansible_user=ec2-user
	
2.3 Ansible copy_image main.yml:
- Added 'Run docker image' step to playbook - to actually start the container on the deployment server.
- After 1st run, every deployment has to first delete the exsisting container, and then re-create it with the new release image.

3. Created release branch from master in 'Personetics-test' git repo.

4. Built multibranch pipeline project named 'Personetics-test' & configured the integration to GitHub.

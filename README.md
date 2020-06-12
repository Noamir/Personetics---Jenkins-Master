Personetics-Jenkins-Master
This repository spins up Jenkins Master on a container with required plugins to deploy <TBD>.

Requirements:
2 Linux servers
ssh connection is open between the servers with the following configurations:
- copy ~/.ssh/id_rsa.pub from Host A (Jenkins Master to be)
- Paste in ~/.ssh/authorized_keys in Host B (Deployment)

How to run:

1. git clone . 

2. Docker installation:
- ./docker-installation.sh

3. Jenkins master installation:
-  docker-compode up -d
- ./jenkins-configuration.sh

4. Jenkins master additional configurations: 
- connect to jenkins ui (unlock first time)
** Jenkins is alreay up with plugins from plugins.txt file
- configure extra permissions for running pipeline projects:
	- Navigate to jenkins > Manage jenkins > In-process Script Approval --> Approve scripts

5. Run Personetics-test pipeline (:    

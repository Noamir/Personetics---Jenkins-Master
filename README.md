status:
*** ssh is open between hosts ***
- copy ~/.ssh/id_rsa.pub from Host A (Jenkins Master to be)
- Paste in ~/.ssh/authorized_keys in Host B (Deployment)


steps:

0. on the host, mkdir jenkins-master, and clone project inside. 

1. Docker installation:
- ./docker-installation.sh

2. Jenkins master installation:
-  docker-compode up -d
- ./jenkins-configuration.sh

3. Jenkins master additional configurations: 
- connect to jenkins ui (unlock first time)
** Jenkins is alreay up with plugins from plugins.txt file
- configure extra permissions for running pipeline projects:
	- Navigate to jenkins > Manage jenkins > In-process Script Approval

4. Run Personetics-test pipeline (:    

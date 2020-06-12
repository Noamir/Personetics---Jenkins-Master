#!/bin/bash

echo "----> declare env vars"

PASS=$(sudo cat ~/jenkins/secrets/initialAdminPassword)
PUBLIC_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)
PLUGINS_LIST=$(cat plugins.txt)


echo "----> cd to /lib"

docker container exec -u 0 jenkins bash -c cd /lib/

echo "----> install jenkins cli"

docker container exec -u 0 jenkins wget http://$PUBLIC_IP:8080/jnlpJars/jenkins-cli.jar


echo "----> install plugins from plugins.txt"

docker container exec -u 0 jenkins java -jar jenkins-cli.jar -s  http://$PUBLIC_IP:8080 -auth admin:$PASS install-plugin $PLUGINS_LIST

echo "----> safe reatart jenkins"

docker container exec -u 0 jenkins java -jar jenkins-cli.jar -s  http://$PUBLIC_IP:8080 -auth admin:$PASS safe-restart

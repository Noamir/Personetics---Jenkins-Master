echo "--> update yum packages"
sudo yum update -y --skip-broken

echo "--> install amazon-linux-extras"
sudo yum install -y amazon-linux-extras;

echo "--> add extras repo"
sudo yum-config-manager --enable extras

echo "--> install docker"
sudo amazon-linux-extras install docker -y

echo "--> enable docker service at startup"
sudo systemctl enable docker

echo "--> add user to docker group"
sudo usermod -a -G docker ec2-user

echo "--> install docker-compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

echo "--> make docker-compose executable"
sudo chmod +x /usr/local/bin/docker-compose

echo "--> symbolic link for docker-compos"
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

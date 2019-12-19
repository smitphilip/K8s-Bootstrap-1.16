curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"

sudo apt-get update

sudo apt-get install -y docker-ce=18.06.1~ce~3-0~ubuntu

# Disable automated updates for docker package
sudo apt-mark hold docker-ce

# Start and enable the docker daemon
sudo systemctl enable docker
sudo systemctl start docker

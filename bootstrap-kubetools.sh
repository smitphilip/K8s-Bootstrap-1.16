curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

sudo apt-get update

sudo apt-get install -y kubelet=1.16.0-00 kubeadm=1.16.0-00 kubectl=1.16.0-00

# Lock software to the required version
sudo apt-mark hold kubelet kubeadm kubectl

# Get kubeadm version
kubeadm version -o short

# Networking
echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

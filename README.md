# K8s-Bootstrap-1.16
In my preparation for the Certified Kubernetes Administrator exam, I'm able to stand up a cluster quickly and easily.

Currently the CKA exam is based on K8s 1.16. 

The scripts lock the versions of the software to prevent unwanted updates. To ensure that the user can practice on the same version as what the exam is based on.

Required OS on all nodes: Ubuntu

## Usage
Get the link to the raw script in this repo, and from an ssh session on your nodes, perform a curl and pipe to bash

i.e. 
```
curl https://raw.githubusercontent.com/smitphilip/K8s-Bootstrap-1.16/master/bootstrap-docker.sh | bash
```
All three scripts are run on all nodes (master and workers)

Additional commands required to finish the install. *ON MASTER ONLY*

`sudo kubeadm init --pod-network-cidr=10.244.0.0/16`

Ensure to save the cluster join command that is in the output of the above command 
```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

kubectl get nodes

kubectl get pods -n kube-system
```
Execute the cluster join command on all worker nodes. It looks something like this:

`sudo kubeadm join $some_ip:6443 --token $some_token --discovery-token-ca-cert-hash $some_hash`

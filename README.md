# K8s-Bootstrap-1.16
Currently the CKA exam is based on K8s 1.16. In my preparation for the exam, I'm able to stand up a cluster quickly and easily.

The scripts lock the versions of the software to prevent unwanted updates. To ensure that the user can practice on the same version as what the exam is based on.

## Usage
Get the link to the raw script, from an ssh session on your nodes, perform a curl and pipe to bash

i.e. 
```
curl https://raw.githubusercontent.com/smitphilip/K8s-Bootstrap-1.16/master/bootstrap-docker.sh | bash
```
All three scripts are run on all nodes (master and workers)

Additional commands required to finish the install. *ON MASTER ONLY*
```

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml
kubectl get nodes

kubectl get pods -n kube-system
```

# kubespray-poc
An example project deploying k8s cluster using kubespray

# Depdendencies
- Vagrant
- VirtualBox
- Docker

# Bootstrap
A quick step-by-step tutorial how to setup a K8s cluster with Kubespray playbooks from this repository.

Start by spinning up VMs using Vagrant.
```
$ vagrant up
```
Afterwards, load a script with aliases from `scripts` directory
```
$ . ./scripts/alias.sh
```
From now on we can use a few shortcut commands for building docker container and applying Ansible configuration to our Vagrant VMs. 

First, let's build a docker contaier containing Kubespray playbooks.
```
# docker-compose build ...
$ dcb
Building kubespray
Sending build context to Docker daemon    373MB
Step 1/5 : FROM python:3.10.6-slim
 ---> af1108142cf5
Step 2/5 : RUN apt-get update -y && apt-get install -y curl openssh-client sshpass
 ---> Using cache
 ---> 7990791ef031
...
```

Next, download admin `kubeconfig` from one of master nodes. To do so, execute `kubeconfig.sh` script like presented below.
```
$ bash scripts/kubeconfig.sh                                        
+ ssh -i ./ssh/id_rsa -o StrictHostKeyChecking=no vagrant@192.168.60.32 'sudo chown -R vagrant:vagrant /etc/kubernetes/admin.conf'
Warning: Permanently added '192.168.60.32' (ED25519) to the list of known hosts.
+ scp -i ./ssh/id_rsa vagrant@192.168.60.32:/etc/kubernetes/admin.conf ./admin.conf
admin.conf                                                                                                                                                                        100% 5645     5.2MB/s   00:00    
+ sed -i s/127.0.0.1/192.168.60.32/g ./admin.conf
```

Last but not least, tell kubectl to use previously downloaded kubeconfig.
```
$ export KUBECONFIG=$(pwd)/admin.conf
```

Finally verify list of nodes.
```
$ kubectl get nodes
NAME           STATUS   ROLES           AGE     VERSION
k8s-master-0   Ready    control-plane   8m35s   v1.24.6
k8s-master-1   Ready    control-plane   7m59s   v1.24.6
k8s-worker-0   Ready    <none>          7m      v1.24.6
k8s-worker-1   Ready    <none>          7m      v1.24.6
k8s-worker-2   Ready    <none>          7m      v1.24.6
k8s-worker-3   Ready    <none>          7m      v1.24.6
```

Congratulation! Your cluster is ready to be used! Get yourself a coffee. 


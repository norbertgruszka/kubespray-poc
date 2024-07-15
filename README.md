# kubespray-poc
An example project deploying k8s cluster using kubespray
 
# Dependencies
- Vagrant
- VirtualBox
- Docker
 
# Bootstrap
A quick step-by-step tutorial on how to set up a K8s cluster with Kubespray playbooks from this repository.
 
Start by spinning up VMs using Vagrant.

```bash
vagrant up
```

Afterwards, load a script with aliases from `scripts` directory

```bash
. ./scripts/alias.sh
```

From now on we can use a few shortcut commands for building docker containers and applying Ansible configuration to our Vagrant VMs.
 
First, let's build a docker container containing Kubespray playbooks.

```bash
# docker-compose build ...
dcb
Building kubespray
Sending build context to Docker daemon    373MB
Step 1/5 : FROM python:3.10.6-slim
---> af1108142cf5
Step 2/5 : RUN apt-get update -y && apt-get install -y curl openssh-client sshpass
---> Using cache
---> 7990791ef031
...
```

Then, run Kubespray playbook

```bash
# ansible-playbook cluster.yml ...
play
```

Next, download admin `kubeconfig` from one of master nodes. To do so, execute `kubeconfig.sh` script like presented below.

```bash
# bash scripts/kubeconfig.sh
kubeconfig                        
+ ssh -i ./ssh/id_rsa -o StrictHostKeyChecking=no vagrant@192.168.60.32 'sudo chown -R vagrant:vagrant /etc/kubernetes/admin.conf'
Warning: Permanently added '192.168.60.32' (ED25519) to the list of known hosts.
+ scp -i ./ssh/id_rsa vagrant@192.168.60.32:/etc/kubernetes/admin.conf ./admin.conf
admin.conf                                                                                                                                                                        100% 5645     5.2MB/s   00:00   
+ sed -i s/127.0.0.1/192.168.60.32/g ./admin.conf
```
 
Last but not least, tell kubectl to use previously downloaded kubeconfig.

```bash
export KUBECONFIG=$(pwd)/admin.conf
```
 
Finally verify the list of nodes.

```bash
kubectl get nodes
NAME           STATUS   ROLES           AGE     VERSION
k8s-master-0   Ready    control-plane   8m35s   v1.24.6
k8s-worker-0   Ready    <none>          7m      v1.24.6
```
 
Congratulations! Your cluster is ready to be used! Get yourself a coffee.
 
# Cleanup
To cleanup all VMs run 

```bash
vagrant destroy -f
```

export AAD_CLIENT_ID=1d9d6bd1-1ba4-40f2-9856-5673084589fb
export AAD_TENANT_ID=217eae80-72fe-430d-85fe-8a34b05cbad9
kubectl config set-credentials "azure-user" \
  --exec-api-version=client.authentication.k8s.io/v1beta1 \
  --exec-command=kubelogin \
  --exec-arg=get-token \
  --exec-arg=--environment \
  --exec-arg=AzurePublicCloud \
  --exec-arg=--server-id \
  --exec-arg=$AAD_CLIENT_ID \
  --exec-arg=--client-id \
  --exec-arg=$AAD_CLIENT_ID \
  --exec-arg=--tenant-id \
  --exec-arg=$AAD_TENANT_ID

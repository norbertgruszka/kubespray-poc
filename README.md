# kubespray-poc
An example project deploying k8s cluster using kubespray

# Depdendencies
- Vagrant
- VirtualBox
- Docker

# Bootstrap
Start by spinning up VMs using Vagrant
```
vagrant up
```
After that, you can load a script with aliases. `. scripts/alias.sh`. With that you can build a docker containr using a `dcb` command and execute playbooks using ´play´ command. 

If we're luck, that should be it. 

## Access to the cluster 
In order to get kubeconfig with administartive access, follow [this](https://github.com/kubernetes-sigs/kubespray/blob/master/docs/setting-up-your-first-cluster.md#access-the-kubernetes-cluster) tutorial.


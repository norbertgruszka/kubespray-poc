#!/bin/bash

git submodule init
cat multus-cni/deployments/multus-daemonset.yml | kubectl apply -f -


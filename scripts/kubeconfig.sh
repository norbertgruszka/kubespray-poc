#!/bin/bash

set -uex

ssh-keygen -f "/home/norbertg/.ssh/known_hosts" -R "192.168.60.32"

ssh -i ./ssh/id_rsa -o StrictHostKeyChecking=no vagrant@192.168.60.32 'sudo chown -R vagrant:vagrant /etc/kubernetes/admin.conf'

scp -i ./ssh/id_rsa vagrant@192.168.60.32:/etc/kubernetes/admin.conf ./admin.conf

sed -i "s/127.0.0.1/192.168.60.32/g" ./admin.conf 


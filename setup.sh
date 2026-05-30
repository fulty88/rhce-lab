#!/usr/bin/env bash

echo "=== Task 1: Enabling Password Authentication ==="
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd

echo "=== Task 2: Setting up /etc/hosts ==="
cat <<EOF >> /etc/hosts
192.168.243.135 control
192.168.243.136 node1
192.168.243.137 node2
192.168.243.138 node3
192.168.243.139 node4
EOF
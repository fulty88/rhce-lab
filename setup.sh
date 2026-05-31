#!/usr/bin/env bash
set -euo pipefail

echo "=== Task 1: Enabling Password Authentication ==="
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd

echo "=== Task 2: Setting up /etc/hosts ==="
grep -q "192.168.243.135 control" /etc/hosts || cat <<EOF >> /etc/hosts
192.168.243.135 control
192.168.243.136 node1
192.168.243.137 node2
192.168.243.138 node3
192.168.243.139 node4
EOF

echo "=== Task 3: Registering node and configuring repositories ==="
subscription-manager register --username "$RHSM_USER" --password "$RHSM_PASS"
rm -f /etc/yum.repos.d/epel*
subscription-manager repos --enable ansible-automation-platform-2.6-for-rhel-9-x86_64-rpms
dnf clean all
dnf makecache
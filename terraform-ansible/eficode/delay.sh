#!/bin/bash
while [ ! -f /etc/ansible/ansible.cfg ]; do
echo -e "Waiting for ansible to bootstrap..."
sleep 30
done

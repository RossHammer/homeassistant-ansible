#/bin/bash

SSH_KEY=~/.ssh/id_rsa

export ANSIBLE_CONFIG=./ansible.cfg
ansible-playbook -i hosts --vault-password-file=$SSH_KEY main.yml

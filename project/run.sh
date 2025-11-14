#!/bin/bash

cd terraform

terraform init

terraform apply --auto-approve

IP=$(terraform output -raw public_ip)

echo "Server IP: $IP"

cd ../ansible

INVENTORY_FILE="inventory.ini"
cat > $INVENTORY_FILE <<EOL
[web]
$IP ansible_user=ubuntu ansible_ssh_private_key_file=~/key/usa.pem ansible_ssh_common_args='-o StrictHostKeyChecking=no'
EOL

sleep 15

ansible-playbook -i $INVENTORY_FILE install_docker.yml
ansible-playbook -i $INVENTORY_FILE deploy_nginx.yml

# Фінальний айпі
echo "Web Server Connect IP: $IP:8080"
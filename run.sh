#/bin/sh

ansible-galaxy install -r requirements.yml
source ./setup-env.sh
ansible-playbook deploy-app.yml --tags "ssh,vps,build" -i production.ini -i do_hosts.yml -vvvv
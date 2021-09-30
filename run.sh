#/bin/sh

ansible-galaxy install -r requirements.yml
source ./setup-env.sh
# ansible-playbook deploy-app.yml --tags "ssh,vps,build,deploy" -i production.ini -i do_hosts.yml -vvvv
ansible-playbook deploy-app.yml --tags "build,deploy" -i production.ini -i do_hosts.yml -vvvv
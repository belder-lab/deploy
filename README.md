# Deploy fastup-kit

## Requirements for deploy
* Docker

## Setup
1. Fork repository
2. Set secure env on github actions:
    1. DO_TOKEN - digital ocean token
    2. SSH_PUB - generated ssh pub key
    3. SSH_PRIVATE - generated ssh private key
3. Set env name on .github/workflows/continuous-deployment.yml:
    1. PROJECT_NAME - project name with symbols `[a-z]` and `-`

## Installation
```sh
ansible-galaxy install -r requirements.yml
```

## Run
```sh
ansible-playbook deploy-app.yml --tags "ssh,vps,backend" -i production.ini -i do_hosts.yml -vvvv
```

## Development
1. Install
2. Generate ssh in `./ssh/` folder of project
3. Create env script
```sh
echo '#/bin/sh

export DO_TOKEN=***
export SSH_PUBLIC_KEY=`cat ./ssh/id_ed25519.pub`
export SSH_PRIVATE_KEY=`cat ./ssh/id_ed25519`' > ./setup-env.sh && chmod +x ./setup-env.sh
```
Change `DO_TOKEN=***` on your Digital Ocean token

4. Add env from setup-env
```sh
source ./setup-env.sh
```
5. Run ansible-playbook

## Dev Notes
Show dynamic inventories:
```sh
ansible-inventory -i do_hosts.yml --graph -vvvv
```

Deploy all
```sh
ansible-playbook deploy-app.yml --tags "ssh,vps,backend" -i production.ini -i do_hosts.yml -vvvv
```

Add in `production` enviroment file
```ini
[do:vars]
ansible_ssh_private_key_file=/Users/<username>/<path_to_project>/deploy/ssh/id_ed25519
```

For building & running
```sh
docker build . -t ansible && docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -it ansible
./run.sh
```
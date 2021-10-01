# Deploy fastup-kit

Scripts for build & deploy on single server

## Requirements for deploy
* Docker

## Setup
1. Fork repository
2. Set secure env on github actions:
    1. DO_TOKEN - digital ocean token
3. Add ssh keys in ssh folder of this project
    1. id_ed25519
    2. id_ed25519.pub
4. Set env name on .github/workflows/continuous-deployment.yml:
    1. PROJECT_NAME - project name with symbols `[a-z]` and `-`

## Run
```sh
docker-compose build && docker-compose run ansible
```

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
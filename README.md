# Deploy fastup-kit

Scripts for build & deploy on single server

<br />
<br />
<br />

⚠⚠⚠ NOTICE: Depricated ⚠⚠⚠

This method of deployment very complicated. The best practice - make deployment script more independent and split it on the small parts, each deployment script by each repository. [Use new way](https://github.com/fastup-kit/deploy-scripts)

<br />
<br />
<br />

## Requirements for deploy
* Docker

## Setup new application
1. Fork repository
2. Create `.env` file (for local deployment) in root with:
  1. DO_TOKEN - digital ocean token
  2. PROJECT_NAME - project name with symbols `[a-z]` and `-`
  3. ... other ENVs for projects, define theme into `docker-compose.yml.j2` too
3. Add ssh keys in `./ssh` folder of this project
  1. `ssh-keygen -t ed25519 -C "your_email@example.com"`
  2. id_ed25519
  3. id_ed25519.pub
4. Add applications in vars/versions.yml
5. Change deploy config in `roles/deployms/files/docker-compose.yml.j2`
  1. Define ENVs from `.env` file
  2. Define application from apps
6. For github actions `.github/workflows/test-build.yml` and `.github/workflows/deploy-ms.yml`: install github ENVs (secrets) the same as in `.env`
  1. SSH_PRIVATE_KEY
  2. SSH_PUBLIC_KEY
  3. DO_TOKEN
  4. PROJECT_NAME

# Commands
```
# Only build
docker-compose build && docker-compose -f docker-compose.yml -f configs/docker-compose.build.yml up ansible

# Deploy only infra
docker-compose build && docker-compose -f docker-compose.yml -f configs/docker-compose.infra.yml up ansible

# Deploy all microservices by vars/versions.yml
docker-compose build && docker-compose -f docker-compose.yml -f configs/docker-compose.all-ms.yml up ansible

# Deploy single microservice by args
docker-compose build && VERSION=v1.0.0 NAME=telegram-bot-microservice REPO=git@github.com:fastup-kit/telegram-bot-microservice.git docker-compose -f docker-compose.yml -f configs/docker-compose.single-ms.yml up ansible
```

## Dev Run
```sh
docker-compose build && docker-compose run ansible
```

## Dev Notes
Show dynamic inventories:
```sh
ansible-inventory -i do_hosts.yml --graph -vvvv
```

Clear all caches:
```
docker stop $(docker ps -q)
docker rm $(docker ps -aq)
docker rmi -f $(docker images -q)
rm -rf .cache
```

Add in `production` enviroment file
```ini
[do:vars]
ansible_ssh_private_key_file=/Users/<username>/<path_to_project>/deploy/ssh/id_ed25519
```

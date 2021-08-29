# Deploy fastup-kit

## Setup
1. Clone repository
2. Set secure env on github actions:
    1. DO_TOKEN - digital ocean token
    2. SSH_PUB - generated ssh pub key
    3. SSH_PRIVATE - generated ssh private key
3. Set default env on github actions:
    1. PROJECT_NAME - project name

## Installation
```sh
ansible-galaxy install -r requirements.yml
```

## Dev Notes
```
ansible-doc -l -t lookup
```
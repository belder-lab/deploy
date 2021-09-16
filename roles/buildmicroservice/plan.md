# ideas
- run ansible script in docker for testing / persistence
- add volume for cache folder (speed up next builds)
- add loop for build

## build
- set deployment version in ansible-playbook argument via "version"
- set deployment project name in ansible-playbook argument via "project"
- ✅ create temp directory for source
- ✅ git clone git@project.git --tag {{ current_deployment_version }}
- ✅ docker build project

## deploy builded
- copy docker image .tar archive from local to remote
- docker load image from .tar archive
- docker-compose up
- clear git folder from localhost
- docker system prune --filter="{{ project }}" # clear from local machine

---
## promotion
- set deployment version in ansible-playbook argument via "version"
- set deployment project name in ansible-playbook argument via "project"
- git clone git@deployment.git
- git commit new version in version.yml
- git push git@deployment.git
- clean docker cache `docker system prune -a`
- clear git folder

## rollback
- get versions from hosts, from compose
- compare diff
- setup docker images from versions.yml
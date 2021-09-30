# ideas
- ✅ run ansible script in docker for testing / persistence
- ✅ add volume for cache folder (speed up next builds)
- 🤗 add loop for build

## build
- ✅ check application on production and compare versions, deploy when version not equal
- ✅ create temp directory for source
- ✅ git clone git@project.git --tag {{ current_deployment_version }}
- ✅ docker build project

## deploy builded
- 🤗 deploy by arguments
  - application
  - git-url
  - version
- ✅ copy docker image .tar archive from local to remote
- ✅ docker load image from .tar archive
- ✅ fetch all compose production files
- ✅ add docker compose file
- 🤗 docker compose file convert in jinja
- 🤗 docker compose throw ENV in container
- ✅ docker-compose up
- clear git folder from localhost
- docker system prune --filter="{{ project }}" # clear from local machine

---
## Auto deploy via github actions
- deploy scripts
- promotion by trigger
  - git clone git@deployment.git
  - git commit new version in version.yml
  - git push git@deployment.git

## rollback
- ✅ get versions from hosts, from compose
- ✅ compare diff versions
- ✅ setup docker images from versions.yml

---
## Improvements
-  Deploy PostgreSQL outside docker
# ideas
- ✅ run ansible script in docker for testing / persistence
- ✅ add volume for cache folder (speed up next builds)
- ✅ add loop for build

## build
- ✅ check application on production and compare versions, deploy when version not equal
- ✅ create temp directory for source
- ✅ git clone git@project.git --tag {{ current_deployment_version }}
- ✅ docker build project

## deploy builded
- ✅ copy docker image .tar archive from local to remote
- ✅ docker load image from .tar archive
- ✅ fetch all compose production files
- ✅ add docker compose file
- ✅ docker compose throw ENV in container
- ✅ docker-compose up
- clear git folder from localhost
- docker system prune --filter="{{ project }}" # clear from local machine
- ✅ remove ssh key from cache

---
## Auto deploy via github actions
- add cache (github actions) for docker layers
- ✅ deploy script by arguments (in deploy repository)
  - arguments:
    - application
    - git-url
    - version
- 🤗 basic CI/CD
- promotion script by trigger (github action)
  - git clone git@deployment.git
  - git commit new version in version.yml
  - git push git@deployment.git

## rollback
- ✅ get versions from hosts, from compose
- ✅ compare diff versions
- ✅ setup docker images from versions.yml

---
## Improvements
- Deploy PostgreSQL outside docker
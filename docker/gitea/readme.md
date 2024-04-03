# docker-gitea-example
docker gitea example for testing git commandline

## contents
- [docker-gitea-example](#docker-gitea-example)
  - [contents](#contents)
  - [installation](#installation)
  - [usage](#usage)
  - [resources](#resources)
  - [tests](#tests)

## installation
* by default the sqlite database is used
* checl UID and GID with `id -u username` and `id -g username` for `.env` file user
* adjust environment settings for and `.env`
* docker compose configuration you will find `docker-compose.yml`
* call gitea webfrontend (e.g. http://localhost:3000) login and install
* attention - adjust the admin user an the end of the install dialogue

## usage 
* configuration of git login [configuration](git-configuration.md)
* test commands [commands](git-commands.md)
* delete all docker instances and data after testing
  - `clean-git-repos.sh` 

## resources
* standard lib [lib](../../../posix-lib-utils/)

## tests
* not testet completly
  
---
*[v0.1.0]*

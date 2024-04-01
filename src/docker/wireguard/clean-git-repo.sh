#!/bin/sh

#set -x

# set absolute path of root app for global use
SCRIPT_ROOT_PATH=$(pwd)

# include external libs from git submodule
if [ -f  ./posix-lib-utils/standard_lib.sh ]; then
    . ./posix-lib-utils/docker_lib.sh
else
    printf "$0: external libs not found - exit."
    exit 1
fi

# print header
print_header "delete all docker data"


# load enviroment variables
log -info "load environment variables"
. ./.env

# print verion
log -info "version of environemte file ${DOCKER_GENERAL_VERSION}"

# delete docker instance data
docker_delete_data


# delete productive files
docker_delete_local_data() {

    log -info "delete prductive data"

    # remove mosquitto data
    if [ -d ${DOCKER_GITEA_VOLUME} ] && \
        [ ! ${DOCKER_GITEA_VOLUME} = "/" ] && \
        [ ! -z ${DOCKER_GITEA_VOLUME} ]; then
            log -info "delete filed in ${DOCKER_GITEA_VOLUME}"
            rm -r ${DOCKER_GITEA_VOLUME}
    fi
}

#delete docker local data
docker_delete_local_data
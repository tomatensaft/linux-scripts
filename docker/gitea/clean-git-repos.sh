#!/bin/sh
#SPDX-License-Identifier: MIT

#set -x

# set absolute path of root app for global use - relative path from this point
# ${PWD%/*} -> one folder up / ${PWD%/*/*} -> two folders up 
SCRIPT_ROOT_PATH="${PWD%/*/*}/posix-lib-utils"

# test include external libs from debian submodule
if [ -f  ${SCRIPT_ROOT_PATH}/docker_lib.sh ]; then
    . ${SCRIPT_ROOT_PATH}/docker_lib.sh
else
    printf "$0: docker external libs not found - exit.\n"
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
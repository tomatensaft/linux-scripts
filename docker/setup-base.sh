#!/bin/sh
#SPDX-License-Identifier: MIT

#set -x

# set absolute path of root app for global use - relative path from this point
# ${PWD%/*} -> one folder up / ${PWD%/*/*} -> two folders up 
SCRIPT_ROOT_PATH="${PWD%/*}/posix-lib-utils"

# test include external libs from debian submodule
if [ -f  ${SCRIPT_ROOT_PATH}/docker_lib.sh ]; then
    . ${SCRIPT_ROOT_PATH}/docker_lib.sh
else
    printf "$0: docker external libs not found - exit.\n"
    exit 1
fi

# print Hhader
print_header 'docker base system setup'

# check number of args
check_args $# 1

# parameter/arguments
option=$1

# main functions
main() {

    # check inputargs
    case $option in
            --test)
                log -info "test Command for debugging $0"
                ;;

            --setup)
                log -info "setup docker system"
                check_requirements
                docker_setup_system
                ;;

            --help | --info | *)
                usage   "\-\-test:      test command" \
                        "\-\-setup:     setup docker" \
                        "\-\-help:      help" 
                ;;
    esac
}


# Check requirements
check_requirements() {

    # check root
    check_root

    # check command
    if command -v docker >/dev/null 2>&1 ; then
        log -info "program found"
    else
        log -info "program not found"
        cleanup_exit ERR
    fi 
}


# call main function manually - if not need uncomment
main "$@"; exit
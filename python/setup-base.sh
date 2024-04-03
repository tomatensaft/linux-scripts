#!/bin/sh
# SPDX-License-Identifier: MIT

# set -x

# set absolute path of root app for global use - relative path from this point
SCRIPT_ROOT_PATH="../"

# include external libs from git submodule
if [ -f  ${SCRIPT_ROOT_PATH}/posix-lib-utils/debian_lib.sh ]; then
    . ${SCRIPT_ROOT_PATH}/posix-lib-utils/debian_lib.sh
else
    printf "$0: external libs not found - exit.\n"
    exit 1
fi

# print Hhader
print_header 'python base system setup'

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
                log -info "setup python environment"
                check_requirements
                python_setup_system
                ;;

            --help | --info | *)
                usage   "\-\-test:      test command" \
                        "\-\-setup:     setup python" \
                        "\-\-help:      help" 
                ;;
    esac
}


# setup python environment
python_setup_system() {

    log -info "setup python system"
    apt-get -y install python3 pip openssl 
}


# check requirements
check_requirements() {

    # check root
    check_root

    # check command
    if command -v python >/dev/null 2>&1 ; then
        log -info "program found"
    else
        log -info "program not found"
        cleanup_exit ERR
    fi 
}


# call main function manually - if not need uncomment
main "$@"; exit
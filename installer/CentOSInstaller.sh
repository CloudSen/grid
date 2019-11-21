#!/bin/bash

# Author: CloudS3n
# Date: 2019-11-21
# Installer For CentOS x86_64.
# $1: Soft Name, Not Null.
# $2: Show Verbose, Nullable, if 1 then show verbose, if 0 then disable verbose, default 1.

function checkParameters() {
    local softName=$1

    if [[ -z $softName ]]; then
        log error "No soft name passed to centos installer."
        exit
    fi
}

function doInstall() {
    local softName=$1

    checkParameters $softName

    case $softName in
    git)
        log common "Installing git"
        # ./installer/centos/softInstaller/GitInstaller.sh
        ;;
    ssh)
        log common "Installing open-ssh"
        # ./installer/centos/softInstaller/OpenSSHInstaller.sh
        ;;
    zsh)
        log common "Installing zsh"
        # ./installer/centos/softInstaller/ZshInstaller.sh
        ;;
    *)
        log error "Sorry, $softName is not support now."
        exit
        ;;
    esac
}

doInstall $1

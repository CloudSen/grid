#!/bin/bash

# Author: CloudS3n Finn
# Date: 2019-11-23
# Installer For Ubuntu x86_64 or aarch64.
# $1: Soft Name, Not Null.
# $2: Show Verbose, Nullable, if 1 then show verbose, if 0 then disable verbose, default 1.

showVerbose=$2
if [[ $# < 2 || $showVerbose != 1 && $showVerbose != 0 ]]; then
	showVerbose=1
else
	showVerbose=0
fi

function checkParameters() {
    local softName=$1

    if [[ -z $softName ]]; then
        log error "No soft name passed to ubuntu installer." "$showVerbose"
        exit
    fi
}

function doInstall() {
    local softName=$1

    checkParameters $softName

    case $softName in
    git)
        log common "Installing git" "$showVerbose"
        # ./installer/ubuntu/soft/GitInstaller.sh
        ;;
    ssh)
        log common "Installing open-ssh" "$showVerbose"
        # ./installer/ubuntu/soft/OpenSSHInstaller.sh
        ;;
    zsh)
        log common "Installing zsh" "$showVerbose"
        # ./installer/ubuntu/soft/ZshInstaller.sh
        ;;
    *)
        log error "Sorry, $softName is not supported now." "$showVerbose"
        exit
        ;;
    esac
}

doInstall $1

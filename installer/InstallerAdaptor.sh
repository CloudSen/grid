#!/bin/bash

# Author: CloudS3n
# Installer Adaptor
# $1: Linux Distribution Release, Not Null.
# $2: Soft Name, Not Null.
# $3: Show Verbose, Nullable, if 1 then show verbose, if 0 then disable verbose, default 1.

showVerbose=$3

if [[ $# < 3 || $showVerbose != 1 && $showVerbose != 0 ]]; then
    showVerbose=1
    else
	    showVerbose=0
fi

source ./common/CommonFunction.sh

log info "Running Installer Adaptor" "$showVerbose"

function checkParameters() {
    local release=$1
    local softName=$2
    if [[ -z $release || -z $softName ]]; then
        log error "No release or soft name passed to installer adaptor." "$showVerbose"
        exit
    fi
}

function selectInstaller() {
    local release=$1
    local softName=$2

    checkParameters $1 $2

    case $release in
    UBUNTU)
        ./installer/ubuntu/UbuntuInstaller.sh $softName
        ;;
    CENTOS)
        ./installer/centos/CentOSInstaller.sh $softName
        ;;
    ARCH)
        ./installer/arch/ArchLinuxInstaller.sh $softName
        ;;
    *)
        logger error "Can not find installer for $release" "$showVerbose"
        exit
        ;;
    esac
}

selectInstaller $1 $2

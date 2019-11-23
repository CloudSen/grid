#!/bin/bash

# Author: CloudS3n
# Common Logger.
# $1: level.
# $2: msg.
# $3: if 1 or null, enable verbose log print, if 0, disable verbose log print.
# usage: ./logger/Logger.sh $1 $2 $3


source ./common/Color.sh
source ./common/Prefix.sh

## print verbose log?
showVerbose=$3

if [[ $# < 3 || $showVerbose != 1 && $showVerbose != 0 ]]; then
    showVerbose=1
fi

function log() {
    local level=$1
    local msg=$2
    local showVerbose=$3
    local debugLevel=(info common)

    if [[ $showVerbose != 1 && -n "$(printf '%s\n' ${debugLevel[@]} | grep -w ${level})" ]]; then
        return 0
    fi

    case $level in
    logo)
        echo -e "${ltgreen}${msg}${nc}"
        ;;
    info)
        echo -e "${dkgray}${infoPrefix}${msg}${nc}"
        ;;
    warn)
        echo -e "${yellow}${warnPrefix}${dkgray}${msg}${nc}"
        ;;
    ok)
        echo -e "${green}${okPrefix}${msg}${nc}"
        ;;
    "done")
        echo -e "${green}${donePrefix}${msg}${nc}"
        ;;
    error)
        echo -e "${red}${errorPrefix}${msg}${nc}"
        ;;
    common)
        echo -e "${dkgray}$commonPrefix}${msg}${nc}"
        ;;
    short)
        echo -e "${dkgray}$commonPrefixShort}${msg}${nc}"
        ;;
    *)
        echo -e "${dkgray}$commonPrefix}${msg}${nc}"
        ;;
    esac
}

log "$1" "$2" $showVerbose


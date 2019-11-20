#!/bin/bash

# Author: CloudS3n
# Common Log Shell
# $enableVerbose: if 1 or null, enable verbose log print, if 0, disable verbose log print

## print verbose log?
enableVerbose=$1

if [[ $# -lt 1 || $enableVerbose != 1 && $enableVerbose != 0 ]]; then
    enableVerbose=1
fi

## color
nc='\033[0m'
red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'
yellow='\033[1;33m'
ltgreen='\033[1;32m'
ltgray='\033[0;37m'
dkgray='\033[1;30m'

## common prefix
infoPrefix='[ INFO ] '
warnPrefix='[ WARN ] '
errorPrefix='[ ERROR ] '
okPrefix='[ OK ] '
donePrefix='[ DONE ] '
commonPrefix='===> '

function log() {
    level=$1
    msg=$2
    debugLevel=(info common)

    if [[ $enableVerbose != 1 && -n $(printf "${debugLevel[@]}" | grep -w "${level}") ]]; then
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
    *)
        echo -e "${dkgray}$commonPrefix}${msg}${nc}"
        ;;
    esac
}

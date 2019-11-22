#!/bin/bash

# Author: CloudS3n
# Date: 2019-11-21
# $# must greater than 2
# $1: PID
# $2: MSG

source ./logger/Logger.sh

function taskProgress() {
    local spin=('|' '/' '-' '\')
    local stuff=("${yellow} ${nc}" "${green} ${nc}")
    local fullFlag=0
    local maxLen=0
    local msgLen=${#2}
    local progressFullLen=$(($maxLen - $msgLen))
    local progressLen=0
    local msg="${blue}[${nc}$2${blue}]${nc}"

    printf "$msg"
    while kill -0 $1 2>/dev/null; do
        printf "${stuff[${fullFlag}]}"
        ((progressLen++))
        if (($progressLen == $progressFullLen)); then
            fullFlag=$((($fullFlag + 1) % 2))
            printf "\r${msg}${stuff[${fullFlag}]}"
            progressLen=1
        fi
        sleep 0.1
    done

    until (($progressLen == $progressFullLen)); do
        printf "${stuff[${fullFlag}]}"
        ((progressLen++))
    done
    log done ""
}

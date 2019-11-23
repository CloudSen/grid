#!/bin/bash

# Author: CloudS3n
# Linux Automic Installer

clear
## Change permission
chmod +x run.sh
chmod +x ./common/*.sh
chmod +x ./checker/*.sh
chmod +x ./logger/*.sh
chmod +x ./installer/*.sh
chmod +x ./installer/centos/*.sh
chmod +x ./installer/ubuntu/*.sh

showVerbose=$1

if [[ $# != 0 && $showVerbose == '-q' ]]; then
	showVerbose=0
else
	showVerbose=1
fi

source ./common/CommonFunction.sh

## Welcome
log logo "******************************************" "$showVerbose"
log logo "============ Hello [ $USER ] =============" "$showVerbose"
log logo "=========== Automic Installer ============" "$showVerbose"
log logo "******************************************" "$showVerbose"

## Read soft list to array
log info "Reading pop-soft list..." "$showVerbose"

popSoft=($(cat pop-soft))

if [ ${#popSoft[@]} == 0 ]; then
	log error "Soft list is empty, Please add soft name to [pop-soft] configuratioin file." "$showVerbose"
	exit
else
	log ok "Success to read pop-soft list." "$showVerbose"
fi

## Pass soft to Checker
source ./checker/Checker.sh
for softName in "${popSoft[@]}"; do
	checkProgram $softName
done

log "done" "Spend Time: $SECOND s" "$showVerbose"

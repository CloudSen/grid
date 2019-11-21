#!/bin/bash

# Author: CloudS3n
# Linux Automic Installer

showVerbose=$1

if [[ $# != 0 && $showVerbose == '-q' ]]; then
	showVerbose=1
else
	showVerbose=0
fi

source ./logger/logger.sh $showVerbose

## Welcome
log logo "******************************************************************************************"
log logo "================ Hello [ $USER ], U are running AutomicInstaller script =================="
log logo "******************************************************************************************"

## Read soft list to array
log info "Reading pop-soft list..."

popSoft=($(cat pop-soft))

if [ ${#popSoft[@]} == 0 ]; then
	log error "Soft list is empty, Please add soft name to [pop-soft] configuratioin file."
	exit
else
	log ok "Success to read pop-soft list."
fi

## Pass soft to Checker
source ./checker/checker.sh
for softName in "${popSoft[@]}"; do
	checkProgram $softName
done

log "done" "Spend Time: $SECOND s"

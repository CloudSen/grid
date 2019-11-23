#!/bin/bash

# Author: CloudS3n
# Desc: check installed and uninstall system programs

function checkParameters() {
	local popSoft=$1
	if [[ $# == 0 || -z $popSoft ]]; then
		log error "No soft name passed to checker shell." "$showVerbose"
		exit
	fi
}

function checkSystemInfo() {
	local machine="$(uname --machine)"
	local release="$(head -n 1 /etc/os-release)"
	local release="${release^^}"

	if [[ $machine != 'x86_64' && $machine != 'aarch64' ]]; then
		log error "Sorry, this shell only support x86_64 or aarch64  machine currently, But U can implement by yourself." "$showVerbose"
		exit
	fi

	case $release in
	*CENTOS*)
		log info "Your distribution is CentOS $machine." "$showVerbose"
		release="CENTOS"
		;;
	*UBUNTU*)
		log info "Your distribution is Ubuntu $machine." "$showVerbose"
		release="UBUNTU"
		;;
	*ARCH*)
		log info "Your distribution is ArchLinux $machine." "$showVerbose"
		release="ARCH"
		;;
	*)
		log error "UNKNOWN Linux Distribution." "$showVerbose"

		exit
		;;
	esac
}

function checkProgram() {
	local softName=$1
	checkParameters $1
	local release=$?
	log common "Checking $softName ..." "$showVerbose"

	if [[ -x "$(command -v $softName)" ]]; then
		log ok "$softName exists, no need to install." "$showVerbose"

	else
		log warn "$softName not exists, will install latter." "$showVerbose"

		./installer/InstallerAdaptor.sh "$release" "$softName" "$showVerbose"
	fi
}

checkSystemInfo

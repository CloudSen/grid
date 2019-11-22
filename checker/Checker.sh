#!/bin/bash

# Author: CloudS3n
# Desc: check installed and uninstall system programs

## Load log system
source ./logger/Logger.sh

function checkParameters() {
	local popSoft=$1
	if [[ $# == 0 || -z $popSoft ]]; then
		log error "No soft name passed to checker shell."
		exit
	fi
}

function checkSystemInfo() {
	local machine="$(uname --machine)"
	local release="$(head -n 1 /etc/os-release)"
	local release="${release^^}"

	if [[ $machine != 'x86_64' && $machine != 'aarch64' ]]; then
		log error "Sorry, this shell only support x86_64 or aarch64 machine currently, But you can implement by yourself."
		exit
	fi

	case $release in
	*CENTOS*)
		log info "Your distribution is CentOS $machine."
		;;
	*UBUNTU*)
		log info "Your distribution is Ubuntu $machine."
		;;
	*ARCH*)
		log info "Your distribution is ArchLinux $machine."
		;;
	*)
		log error "UNKNOWN Linux Distribution."
		exit
		;;
	esac
}

function checkProgram() {
	local softName=$1
	checkParameters $1
	log common "Checking $softName ..."
	if [[ -x "$(command -v $softName)" ]]; then
		log ok "$softName exists, no need to install."
	else
		log warn "$softName not exists, will install latter."
		./installer/InstallerAdaptor.sh $softName
	fi
}

checkSystemInfo

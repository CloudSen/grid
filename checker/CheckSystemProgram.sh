#!/bin/bash

# Author: CloudS3n
# Desc: check installed and uninstall system programs

echo "[ INFO ] Starting checking programs..."

programs=( git node zsh java )

function doDecompress
{
		echo "===> decompressing $1"
}

function doDownload
{
		echo "===> downloading $1"
}

function doInstall 
{
		doDownload $1
		doDecompress $1
		echo "===> installing $1"		
}


function doCheck
{
		echo "===> checking $1 ..."
		if [ -x "$(command -v $1)" ]
		then
				echo "[ OK ] $program is installed"
		else
				echo "[ WARN ] $1 is not found"
				doInstall $1
		fi
}

for program in "${programs[@]}"
do
		doCheck $program
done


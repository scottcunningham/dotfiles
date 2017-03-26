#!/usr/bin/env bash

DIR=$(pwd)
DATE=$(date +"%Y-%d-%m-%H%M%S")

for i in $(/bin/ls "${DIR}" | grep -v install.sh); do
	echo "Linking ${i}..."
	if [ -e "$HOME/.${i}" ]; then
    		echo "Backing up ${i}"
    		mv "$HOME/.${i}" "$HOME/.${i}.old.${DATE}"
	fi
	ln -s "${DIR}/${i}" "$HOME/.${i}"
done

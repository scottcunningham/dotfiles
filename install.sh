#!/usr/bin/env zsh

DIR=`pwd`
DATE=`date +"%Y-%d-%m-%H%M%S"`

for i in `/bin/ls $DIR | grep -v install.sh`; do
	echo "Linking $i..."
	if [ -e ~/.$i ]; then
    		echo "Backing up $i"
    		mv ~/.$i ~/.$i.old.$DATE
	fi
	ln -s $DIR/$i ~/.$i
done

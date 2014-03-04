#!/usr/bin/env zsh

DIR=`pwd`
DATE=`date | sed s/\ //g`

for i in `/bin/ls $DIR | sed s/"install.sh"//g | xargs`; do
	echo "Linking $i..."
	if [ -e .$i ]; then
    		echo "Backing up $i"
    		mv ~/.$i ~/.$i.old.$DATE
	fi
	ln -s $DIR/$i ~/.$i
done

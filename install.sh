#!/usr/bin/env zsh

for i in `/bin/ls ~/src/dotfiles| sed s/"install.sh"//g | xargs`; do
    if [[ $i != $1 ]]; then 
        echo "Linking $i..."
        if [ -f ~/.$i ]; then
            mv ~/.$i ~/.$1.old.$RANDOM
        fi
        ln -s ~/src/dotfiles/$i ~/.$i
    fi
done

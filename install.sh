#!/usr/bin/env zsh

for i in `/bin/ls ~/src/dotfiles| sed s/"install.sh"//g | xargs`; do
    if [[ $i != $1 ]]; then 
        echo "Linking $i..."
        ln -s ~/src/dotfiles/$i ~/.$i
    fi
done

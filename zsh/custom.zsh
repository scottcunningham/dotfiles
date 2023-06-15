# Include homebrew ahead of default PATH and ~/bin after it
export PATH=/usr/local/bin/:$PATH:$HOME/bin
export EDITOR=vim
export KEYTIMEOUT=1

# overwrite files
setopt clobber

# don't randomly cd to shitty homedirs
unsetopt cdablevars

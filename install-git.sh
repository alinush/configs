#!/bin/bash

set -e
scriptdir=$(readlink -f $(dirname $0))
conffile=.gitconfig

if git --version | grep 1\.7; then
    conffile=.gitconfig-1.7
    echo "Detected older version of git, using .gitconfig file: $conffile" 
fi

[ -f ~/.gitconfig ] && mv ~/.gitconfig ~/.gitconfig.`date +%s`
ln -s $scriptdir/conf-files/$conffile ~/.gitconfig

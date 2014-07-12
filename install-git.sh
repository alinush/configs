#!/bin/bash

set -e
scriptdir=$(readlink -f $(dirname $0))

[ -f ~/.gitconfig ] && mv ~/.gitconfig ~/.gitconfig.`date +%s`
ln -s $scriptdir/conf-files/.gitconfig ~/.gitconfig

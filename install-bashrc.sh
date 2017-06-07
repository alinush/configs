#!/bin/bash

set -e
#scriptdir=$(readlink -f $(dirname $0))
scriptdir=$( cd $(dirname $0) ; pwd -P )

. $scriptdir/shlibs/os.sh

confdir=$scriptdir/conf-files/bash
bashrc=~/.bashrc

echo "" >> $bashrc
echo "# Some custom modifications" >> $bashrc

# Source ~/.bash_aliases in ~/.bashrc when on Fedora or OS X
if [ "$OS" = "Linux" -a "$OS_FLAVOR" = "Fedora" ]; then
    echo " . /etc/bashrc" >> $bashrc
    echo "[ -f ~/.bash_aliases ] && . ~/.bash_aliases" >> $bashrc
fi

if [ "$OS" = "OSX" ]; then
    echo " . /etc/bashrc" >> $bashrc
    echo "[ -f ~/.bash_aliases ] && . ~/.bash_aliases" >> $bashrc
    [ -f ~/.profile ] && mv ~/.profile ~/.profile.`date +%s`
    ln -s "$scriptdir/conf-files/osx/.profile" ~/.profile
fi 

# Setup .bash_aliases
[ -f ~/.bash_aliases ] && mv ~/.bash_aliases ~/.bash_aliases.`date +%s`
[ -L ~/.bash_aliases ] && mv ~/.bash_aliases ~/.bash_aliases.`date +%s`
ln -s $confdir/.bash_aliases ~/.bash_aliases

# sha256sum alias for OSX
if [ "$OS" = "OSX" ]; then
    echo "alias sha256sum='shasum -a 256'" >~/.bashrc
fi

if [ "$OS" = "Linux" ]; then
    # Setup history, less, dircolors, grc aliases and the bash prompt
    echo ". $confdir/history.sh"            >> $bashrc
    echo ". $confdir/less.sh"               >> $bashrc
    $scriptdir/ubuntu/install-solarized.sh
else
    $scriptdir/osx/install-solarized.sh
fi

echo ". $confdir/setup-grc-aliases.sh"  >> $bashrc
echo ". $confdir/setup-bash-prompt.sh"  >> $bashrc
echo ". $confdir/setup-dircolors.sh"    >> $bashrc

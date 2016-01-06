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
    # Create ~/.profile which sources .bashrc 
    echo ". ~/.bashrc" >>~/.profile
fi 

# Setup .bash_aliases
[ -f ~/.bash_aliases ] && mv ~/.bash_aliases ~/.bash_aliases.`date +%s`
[ -L ~/.bash_aliases ] && mv ~/.bash_aliases ~/.bash_aliases.`date +%s`
ln -s $scriptdir/conf-files/bash/.bash_aliases ~/.bash_aliases

if [ "$OS" = "Linux" ]; then
    # Setup history, less, dircolors, grc aliases and the bash prompt
    echo ". $confdir/history.sh"            >> $bashrc
    echo ". $confdir/less.sh"               >> $bashrc
    echo ". $confdir/setup-grc-aliases.sh"  >> $bashrc
    echo ". $confdir/setup-bash-prompt.sh"  >> $bashrc
    echo ". $confdir/setup-dircolors.sh"    >> $bashrc

    # Setup solarized theme
    (
        cd /tmp
    
        # Use -S here not -s, because -s apparently suceeds on some
        # configurations even when the package is not installed
        if [ -n "`dpkg -l | grep gnome-terminal`" ]; then
            git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
            (
                cd gnome-terminal-colors-solarized/
                ./install.sh -s dark -p Default
            )
        fi
    
        git clone https://github.com/seebi/dircolors-solarized
        (
            cd dircolors-solarized/
            #cp dircolors.256dark ~/.dircolors
            cp dircolors.ansi-dark ~/.dircolors
        )
    )
fi

#!/bin/bash

set -e
scriptdir=$(readlink -f $(dirname $0))

confdir=$scriptdir/conf-files/bash
bashrc=~/.bashrc

echo "" >> $bashrc
echo "# Some custom modifications" >> $bashrc

# Source ~/.bash_aliases in ~/.bashrc when on Fedora
if [ -f /etc/issue ]; then
    if grep Fedora /etc/issue >/dev/null; then
        echo " . /etc/bashrc" >> $bashrc
        echo "[ -f ~/.bash_aliases ] && . ~/.bash_aliases" >> $bashrc
    fi
fi

# Setup history, less, dircolors, grc aliases and the bash prompt
echo ". $confdir/history.sh"            >> $bashrc
echo ". $confdir/less.sh"               >> $bashrc
echo ". $confdir/setup-grc-aliases.sh"  >> $bashrc
echo ". $confdir/setup-bash-prompt.sh"  >> $bashrc
echo ". $confdir/setup-dircolors.sh"    >> $bashrc

# Setup .bash_aliases
[ -f ~/.bash_aliases ] && mv ~/.bash_aliases ~/.bash_aliases.`date +%s`
[ -L ~/.bash_aliases ] && mv ~/.bash_aliases ~/.bash_aliases.`date +%s`
ln -s $scriptdir/conf-files/bash/.bash_aliases ~/.bash_aliases

# Setup solarized theme
(
    cd /tmp
    
    if dpkg -s gnome-terminal 2>&1 >/dev/null; then
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

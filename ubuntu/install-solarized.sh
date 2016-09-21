#!/bin/bash

set -e
scriptdir=$(readlink -f $(dirname $0))

# Setup solarized theme
(

    cd /tmp

    # Use -S here not -s, because -s apparently suceeds on some
    # configurations even when the package is not installed
    if [ -n "`dpkg -l | grep gnome-terminal`" ]; then
        git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
        (
            cd gnome-terminal-colors-solarized/
            ./install.sh -s dark
        )
    fi

    git clone https://github.com/seebi/dircolors-solarized
    (
        cd dircolors-solarized/
        #cp dircolors.256dark ~/.dircolors
        cp dircolors.ansi-dark ~/.dircolors
    )
)

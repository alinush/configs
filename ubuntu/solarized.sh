#!/bin/bash

set -e
scriptdir=$(readlink -f $(dirname $0))

# Setup solarized theme
(
    git clone https://github.com/seebi/dircolors-solarized
    (
        cd dircolors-solarized/
        #cp dircolors.256dark ~/.dircolors
        cp dircolors.ansi-dark ~/.dircolors
    )
)

#!/bin/bash

function gacp() {
    if [ $# -eq 0 ]; then
        echo "ERROR: You need to provided a commit message as a parameter"
        return 1
    fi

    echo
    echo "Adding all files in `pwd`..."
    git add . || return 1 

    echo
    echo "Committing with message: \"$@\" ..."
    git commit -m "$*" || return 1

    echo
    echo "Pushing changes..."
    git push || return 1
}

alias ga='git add'
alias gd='git diff'
alias gls='git logshort'
alias gpr='git pull --rebase'
alias gst='git status'

alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'
alias ag='sudo apt-get'
alias acs='sudo apt-cache search'

alias yr='sudo yum remove'
alias yi='sudo yum install'
alias yu='sudo yum update'
alias ys='sudo yum search'

alias diff='colordiff'

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias vim='vim -O'

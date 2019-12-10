#!/bin/bash

function gacp() {
    if [ $# -eq 0 ]; then
        echo "ERROR: You need to provided a commit message as a parameter"
        return 1
    fi

    if [ "$*" = "." ]; then
        echo "ERROR: A single dot ('.') is not a valid commit message ^_^!"
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

alias ll='ls -lh'

alias ga='git add'
alias gc='git clone'
alias gd='git diff'
alias gl='git log'
alias gls='git logshort'
alias gpr='git pull --rebase'
alias gspr='git stash && git pull --rebase && git stash pop'
alias gst='git status'
alias glsu='git ls-files --others --exclude-standard'
alias gsu='git submodule update'
alias gsh='git show'
alias gcp='git cherry-pick'

alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'
alias ag='sudo apt-get'
alias agdu='agu && ag -y dist-upgrade && ag autoremove'
alias acs='sudo apt-cache search'

alias yr='sudo yum remove'
alias yi='sudo yum install'
alias yu='sudo yum update'
alias ys='sudo yum search'

alias diff='colordiff'

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias vim='vim -O'

alias rst='repo-status.py'
alias ru='repo-update.py'
alias rc='repo-clone.py'

alias td='todo.sh -nt'
alias tdl='td ls'
alias ccat='pygmentize -g -O style=colorful,linenos=1'

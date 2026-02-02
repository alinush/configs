#!/bin/bash

function gacp() {
    if [ "$1" = "-m" ]; then
        echo "ERROR: Did you mean to call 'git commit -m'?"
        return 1
    fi

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

function gacnp() {
    if [ "$1" = "-m" ]; then
        echo "ERROR: Did you mean to call 'git commit -m'?"
        return 1
    fi

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
    git commit -m "$*" -n || return 1

    echo
    echo "Pushing changes..."
    git push || return 1
}

alias ll='ls -lh'

alias ga='git add'
alias gc='git clone'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdw='git diff --word-diff'
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

# Helper function to run rpt scripts with venv
function _rpt_run() {
    local script="$1"
    shift
    local rpt_dir="$HOME/repos/rpt"
    local venv_dir="$rpt_dir/venv"
    
    # Create venv if it doesn't exist
    if [ ! -d "$venv_dir" ]; then
        echo "Creating virtual environment..."
        python3 -m venv "$venv_dir" || return 1
    fi
    
    # Activate venv and install deps if needed
    source "$venv_dir/bin/activate"
    if ! python3 -c "import click" 2>/dev/null; then
        echo "Installing dependencies..."
        pip install -r "$rpt_dir/requirements.txt" || return 1
    fi
    
    # Run the script with all arguments
    "$rpt_dir/$script" "$@"
    
    deactivate
}

function rst() { _rpt_run "repo-status.py" "$@"; }
function ru() { _rpt_run "repo-update.py" "$@"; }
function rc() { _rpt_run "repo-clone.py" "$@"; }

# Helper function to run ck with venv
function ck() {
    local ck_dir="$HOME/repos/ck"
    local venv_dir="$ck_dir/venv"
    
    # Create venv if it doesn't exist
    if [ ! -d "$venv_dir" ]; then
        echo "Creating virtual environment..."
        python3 -m venv "$venv_dir" || return 1
    fi
    
    # Activate venv and install deps if needed
    source "$venv_dir/bin/activate"
    if ! python3 -c "import click" 2>/dev/null; then
        echo "Installing dependencies..."
        pip install -r "$ck_dir/requirements.txt" || return 1
    fi
    
    # Run ck with all arguments
    "$ck_dir/ck" "$@"
    
    deactivate
}

alias td='todo.sh -nt'
alias tda='td add'
alias tdo='vim ~/todo.txt'
alias tdc='vim ~/.todo/config'
alias tdd='td do'
alias tdl='td ls'
alias tdr='td rm'
alias ccat='pygmentize -g -O style=colorful,linenos=1'

alias grep-tex='grep --include="*.tex"'
alias grep-apt='grep --exclude-dir=cached-packages --exclude-dir=build --exclude-dir=node_modules --exclude-dir=target --exclude-dir=.git --exclude="*.svg" --exclude-dir=".idea" --exclude=*.fun_data --exclude=*.md --exclude-dir=.venv'
alias grep-sdk='grep-aptos --exclude-dir=dist --exclude-dir=docs --exclude-dir=node_modules --exclude="*.html"'
alias grep-move='grep-aptos --include="*.move"'
alias grep-toml='grep-aptos --include="*.toml"'

aptos_rebase() {
    if [ -z "$1" ]; then
        rebase_from=main
    else
        rebase_from=$1
    fi
    echo "Rebasing w.r.t. to $rebase_from branch..."
    branch=`git rev-parse --abbrev-ref HEAD`
    git checkout $rebase_from || return 1
    git pull --rebase || return 1
    git checkout $branch || return 1

    git rebase $rebase_from || return 1
}

aptos_merge() {
    git fetch
    
    if [ -z "$1" ]; then
        rebase_from=main
    else
        rebase_from=$1
    fi

    # the `git fetch` was not enough, so will manually pull all changes to main
    branch=`git rev-parse --abbrev-ref HEAD`
    git checkout $rebase_from || return 1
    git pull --rebase || return 1
    git checkout $branch || return 1

    git merge origin/$rebase_from --no-commit --no-ff
}


configs
=======

Linux configs (.bash_aliases, .grc, .vimrc, .gitconfig) that become a pain to maintain across three different machines.

Works with Ubuntu 16.04 (not necessarily earlier versions).

## Setting up a new machine

    ./init-0-sudoers.sh
    
    ./install-git.sh
    ./install-grc.sh
    ./ubuntu/install-cli-apps.sh
    
    ./install-bashrc.sh
    ./install-vim.sh

## Installing extra stuff

Then, go crazy either in `ubuntu/` directory or `osx/` directory.

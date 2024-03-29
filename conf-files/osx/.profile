alias ls='ls -G'
alias l='ls -CF'
alias la='l -a'
alias dircolors='gdircolors'
alias grep='grep --color=auto'

eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

if [ -f ~/.brew_github_api_token ]; then
    . ~/.brew_github_api_token
fi

. ~/.bash_aliases
. ~/.bashrc

. "$HOME/.cargo/env"

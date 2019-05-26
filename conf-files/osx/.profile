alias ls='ls -G'
alias l='ls -CF'
alias la='l -a'
alias dircolors='gdircolors'
alias grep='grep --color=auto'

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

if [ -f ~/.brew_github_api_token ]; then
    . ~/.brew_github_api_token
fi

. ~/.bashrc


export PATH="$HOME/.cargo/bin:$PATH"

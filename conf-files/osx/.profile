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

export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/repos/ck"
export PATH="$PATH:$HOME/repos/rpt"
export PATH="$PATH:$HOME/repos/badscripts"
export PATH="$PATH:$HOME/repos/scripts/src"

# pnpm
export PNPM_HOME="/Users/alinush/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Rust
. "$HOME/.cargo/env"
export RUST_MIN_STACK=4297152

# Ruby
eval "$(rbenv init - bash)"

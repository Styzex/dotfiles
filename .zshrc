export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/home/viktor/go/bin
export PATH=/home/viktor/.nimble/bin:$PATH

ZSH_THEME="robbyrussell"

plugins=(git golang tmux zoxide zsh-autosuggestions zsh-syntax-highlighting)

ZOXIDE_CMD_OVERRIDE="cd"

eval "$(zoxide init zsh)"

source $ZSH/oh-my-zsh.sh

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach-session -t default || tmux new-session -s default
  tmux source ~/.tmux.conf
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fnm
FNM_PATH="/home/viktor/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

# bun completions
[ -s "/home/viktor/.bun/_bun" ] && source "/home/viktor/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

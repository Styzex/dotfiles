export ZSH="$HOME/.oh-my-zsh"
export TERM="screen"

ZSH_THEME="robbyrussell"

plugins=(git golang tmux zoxide)

ZOXIDE_CMD_OVERRIDE="cd"

eval "$(zoxide init zsh)"

source $ZSH/oh-my-zsh.sh

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach-session -t default || tmux new-session -s default
fi

#!/bin/bash
set -e

if command -v yay &>/dev/null; then
  echo ">> Installing dev components..."
  sudo pacman -Syu --noconfirm --needed ca-certificates openssl git curl unzip
  yay -S --noconfirm --needed docker-desktop ghostty-git nvim ripgrep zoxide fzf
  echo ">> Installed dev components..."
fi

if ! command -v zsh &>/dev/null; then
  yay -S --noconfirm --needed zsh
  export RUNZSH=no
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if ! command -v tmux &>/dev/null; then
  yay -S --noconfirm --needed tmux
  curl -fsSL "https://github.com/gpakosz/.tmux/raw/refs/heads/master/install.sh#$(date +%s)" | bash
  grep -Fxq "$LOCAL_LINE" "$OMTM_CONF" || echo "$LOCAL_LINE" >> "$OMTM_CONF"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if ! command -v cargo &>/dev/null; then
  echo ">> Installing Rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  if ! command -v cargo &>/dev/null; then
    echo ">> Failed to install Rust!"
  else
    echo ">> Installed Rust!"
  fi
fi

if ! command -v go &>/dev/null; then
  echo ">> Installing Go..."
  curl -LO "$GO_TARBALL_URL"
  sudo rm -rf /usr/local/go
  sudo tar -C /usr/local -xzf $(basename $GO_TARBALL_URL)
  export PATH=$PATH:/usr/local/go/bin
  if ! command -v go &>/dev/null; then
    echo ">> Failed to install Go!"
  else
    echo ">> Installed Go!"
  fi
fi

if ! command -v nvm &>/dev/null; then
  echo ">> Installing FNM (Fast Node Manager)..."
  curl -fsSL https://fnm.vercel.app/install | bash
  export PATH="$HOME/.fnm:$PATH"
  eval "$(fnm env)"
  fnm install --lts
  fnm use --lts
  echo ">> Installed FNM + Node (LTS)"
fi

if ! command -v bun &>/dev/null; then
  echo ">> Installing Bun..."
  curl -fsSL https://bun.sh/install | bash
  export BUN_INSTALL="$HOME/.bun"
  export PATH=$BUN_INSTALL/bin:$PATH
  echo ">> Installed Bun"
fi

echo ">> Installing fonts"
yay -S --needed --noconfirm ttf-jetbrains-mono-nerd ttf-cascadia-code-nerd ttf-nerd-fonts-symbols
fc-cache -f -v
echo ">> Installed fonts"

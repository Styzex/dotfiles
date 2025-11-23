#!/bin/bash
set -e

OMTM_CONF="$HOME/.config/.oh-my-tmux/.tmux.conf"
LOCAL_LINE="source -q ~/.tmux.conf.local"

echo ">> Installing dev components..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y ca-certificates openssl git curl unzip ripgrep zoxide fzf

# Neovim (latest stable from GitHub releases)
if ! command -v nvim &>/dev/null; then
  echo ">> Installing Neovim..."
  sudo apt install -y neovim
  echo ">> Installed Neovim"
fi

echo ">> Installed dev components..."

# Zsh + Oh My Zsh
if ! command -v zsh &>/dev/null; then
  sudo apt install -y zsh
fi
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  export RUNZSH=no
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Tmux + Oh My Tmux + TPM # Exits the script after Oh My Tmux installs
if ! command -v tmux &>/dev/null; then
  sudo apt install -y tmux
fi
if [ ! -d "$HOME/.tmux" ]; then
  (curl -fsSL "https://github.com/gpakosz/.tmux/raw/refs/heads/master/install.sh#$(date +%s)" | bash) || true
  grep -Fxq "$LOCAL_LINE" "$OMTM_CONF" 2>/dev/null || echo "$LOCAL_LINE" >> "$OMTM_CONF"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Rust
if ! command -v cargo &>/dev/null; then
  echo ">> Installing Rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source "$HOME/.cargo/env"
  if command -v cargo &>/dev/null; then
    echo ">> Installed Rust!"
  else
    echo ">> Failed to install Rust!"
  fi
fi

# Go # Doesn't work well has issues with some url
if ! command -v go &>/dev/null; then
  echo ">> Installing Go..."
  sudo apt install golang-go
  export PATH=$PATH:/usr/local/go/bin
  if command -v go &>/dev/null; then
    echo ">> Installed Go!"
  else
    echo ">> Failed to install Go!"
  fi
fi

# FNM (Fast Node Manager)
if ! command -v fnm &>/dev/null; then
  echo ">> Installing FNM (Fast Node Manager)..."
  curl -fsSL https://fnm.vercel.app/install | bash
  export PATH="$HOME/.local/share/fnm:$PATH"
  eval "$(fnm env)"
  fnm install 24
  fnm use 24
  echo ">> Installed FNM + Node (LTS)"
fi

# Bun
if ! command -v bun &>/dev/null; then
  echo ">> Installing Bun..."
  curl -fsSL https://bun.sh/install | bash
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
  echo ">> Installed Bun"
fi

# Zed
curl -f https://zed.dev/install.sh | sh

# Nerd Fonts
echo ">> Installing fonts..."
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

curl -fLo "$FONT_DIR/JetBrainsMono.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
curl -fLo "$FONT_DIR/CascadiaCode.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaCode.zip
curl -fLo "$FONT_DIR/NerdFontsSymbolsOnly.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/NerdFontsSymbolsOnly.zip

unzip -o "$FONT_DIR/JetBrainsMono.zip" -d "$FONT_DIR"
unzip -o "$FONT_DIR/CascadiaCode.zip" -d "$FONT_DIR"
unzip -o "$FONT_DIR/NerdFontsSymbolsOnly.zip" -d "$FONT_DIR"

rm "$FONT_DIR"/*.zip
fc-cache -f -v
echo ">> Installed fonts"

echo ">> Dev setup complete!"

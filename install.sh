#!/usr/bin/env bash
set -e

echo "🔧 Detecting system and installing packages..."

# Detect OS and set package manager
if command -v dnf &> /dev/null; then
  PM="dnf"
  INSTALL="sudo dnf install -y"
elif command -v apt &> /dev/null; then
  PM="apt"
  INSTALL="sudo apt install -y"
  sudo apt update
else
  echo "❌ Unsupported system — only apt and dnf are supported."
  exit 1
fi

# Common packages
$INSTALL neovim tmux zsh git curl unzip

# --- Install starship ---
if ! command -v starship &> /dev/null; then
  echo "🌟 Installing starship..."
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

# --- Install fastfetch ---
if ! command -v fastfetch &> /dev/null; then
  echo "⚡ Installing fastfetch..."
  if [ "$PM" = "apt" ]; then
    # fastfetch may not exist in older apt repos
    sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch || true
    sudo apt update
    sudo apt install -y fastfetch || echo "⚠️ fastfetch may not be available on this apt-based system"
  else
    $INSTALL fastfetch
  fi
fi

# --- Install kitty ---
if ! command -v kitty &> /dev/null; then
  echo "🐱 Installing kitty from official script..."
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
  mkdir -p ~/.local/bin
  ln -sf ~/.local/kitty.app/bin/kitty ~/.local/bin/kitty
  ln -sf ~/.local/kitty.app/bin/kitten ~/.local/bin/kitten
fi

# -------------------------
# Symlink dotfiles
# -------------------------
echo "🔗 Linking dotfiles..."

DOTFILES_DIR=$(pwd)

ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"

mkdir -p "$HOME/.config"

ln -sf "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
ln -sf "$DOTFILES_DIR/fastfetch" "$HOME/.config/fastfetch"
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
ln -sf "$DOTFILES_DIR/kitty" "$HOME/.config/kitty"
ln -sf "$DOTFILES_DIR/hypr" "$HOME/.config/hypr"
ln -sf "$DOTFILES_DIR/wofi" "$HOME/.config/wofi"
ln -sf "$DOTFILES_DIR/waybar" "$HOME/.config/waybar"
ln -sf "$DOTFILES_DIR/swaync" "$HOME/.config/swaync"
ln -sf "$DOTFILES_DIR/matugen" "$HOME/.config/matugen"

# Set shell to zsh
if [[ "$SHELL" != *"zsh" ]]; then
  echo "🐚 Changing shell to zsh..."
  chsh -s "$(which zsh)"
fi

echo "✅ Setup complete for $PM-based system!"
echo "PLEASE INSTALL HYPRLAND AND EVERYTHING ELSE MANUALLY (TOO RISKY TO DO IT FROM HERE...)"

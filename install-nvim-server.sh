#!/bin/sh
# Run as root: curl -fsSL https://raw.githubusercontent.com/valurkristinn/dotfiles/main/install-nvim-server.sh | sh
set -e

NVIM_VERSION="v0.12.6"

apt-get update && apt-get install -y git stow

curl -fsSL "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux-x86_64.tar.gz" | tar -xz -C /opt
ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
touch ~/.nvim-lean
git clone https://github.com/valurkristinn/dotfiles ~/dotfiles
cd ~/dotfiles && stow nvim

#!/bin/bash

nvim_Warning() {
  echo "Install neovim, and try again."
  exit
}

rg_Warning() {
  echo "Install rg(ripgrep) and try again."
  echo "(Telescope dependency)."
  echo "It's need for search in text of files."
  exit }

node_Warning() {
  echo "Install nodejs and try again."
  echo "(Actually we need npm - it's nodejs package manager)."
  echo "For automatic install features like language servers, linters and another."
  exit }

git_Warning() {
  echo "Install git and try again."
  echo "(Required by lazygit)."
  echo "Need to work with git, and downloading packages from github."
  exit
}

rename_Dir() {
  mv $HOME/.config/nvim $HOME/.config/nvim.old
  echo "We save your current config of Neovim to ~/.config/nvim.old."
  clone
}

clone() {
  echo "Cloning..."
  git clone https://github.com/RAprogramm/NEVIRAIDE.git
}

which nvim >/dev/null && echo "Neovim is installed" || nvim_Warning
which node >/dev/null && echo "Node is installed" || node_Warning
which git >/dev/null && echo "Git is installed" || git_Warning
which rg >/dev/null && echo "RipGrep is installed" || rg_Warning

[ -d "$HOME/.config/nvim" ] && rename_Dir || clone

# #!/bin/bash
#
# nvim_Warning() {
#   echo "Install neovim, and try again"
#   exit
# }
#
# rg_Warning() {
#   echo "Install ripgrep and try again"
#   exit }
#
# node_Warning() {
#   echo "Install node and try again"
#   exit }
#
# git_Warning() {
#   echo "Install git and try again"
#   exit
# }
#
# rename_Dir() {
#   mv $HOME/.config/nvim $HOME/.config/nvim.old
#   echo "Your current neovim config transfered to ~/.config/nvim.old"
#   clone
# }
#
# clone() {
#   echo "Cloning..."
#   git #my repo
# }
#
# which nvim >/dev/null && echo "Neovim is installed" || nvim_Warning
# which node >/dev/null && echo "Node is installed" || node_Warning
# which git >/dev/null && echo "Git is installed" || git_Warning
# which git >/dev/null && echo "RipGrep is installed" || rg_Warning
#
# [ -d "$HOME/.config/nvim" ] && rename_Dir || clone

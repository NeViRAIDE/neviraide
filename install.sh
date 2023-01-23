#!/bin/bash

UBUNTU=`uname -a | grep -i ubuntu >/dev/null`
READY=true

if $UBUNTU; then FD=fdfind; else FD=fd; fi

# clone NEVIRAIDE repository from github.com to your .config
clone() {
    echo "Cloning..."
    git clone -v --progress https://github.com/RAprogramm/NEVIRAIDE.git $HOME/.config/nvim
}

# save old neovim config to .old directory
rename_Dir() {
    mv $HOME/.config/nvim $HOME/.config/nvim.old
    echo "Your current configuration of Neovim save in ~/.config/nvim.old"
}

check() {
    name=$1
    have="echo -e \t✅ $name installed"
    not_have="echo -e \t❌ $name not installed"
    case $name in
        "neo") if command -v $name >/dev/null; then $have; else $not_have; fi ;;
        "nonicons") if fc-list | grep $name >/dev/null; then $have; else $not_have; fi ;;
        *) if which $name >/dev/null; then $have; else $not_have; READY=false; fi ;;
    esac
}

check_dependencies() {
    echo "  Checking requirements for correct work:"
    check nvim
    check git
    check npm
    check lazygit
    check $FD
    check rg
    check unzip
    check delta
    check nonicons
    check neo
    if $READY; then echo "  All prepared for installation! 👍"; else echo "Install all dependencies!"; fi
}

install_start() {
    echo "      Installing NEVIRAIDE..."
    # rename_Dir
    # clone
    echo "NEVIRAIDE has been installed! 🎉"
}

echo "      GREETEENGS!"
echo "Now will be install NEVIRAIDE."
check_dependencies
if $READY; then
    install_start
fi

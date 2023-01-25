#!/bin/bash

UBUNTU=`uname -a | grep -i ubuntu >/dev/null`
READY=true

if $UBUNTU; then
    FD=fdfind
    INSTALL=`printf "sudo apt install %s" $1`
else
    FD=fd
    INSTALL=`printf "sudo pacman -S %s" $1`
fi

# Clone NEVIRAIDE repository from github.com to your .config as nvim
clone() {
    echo "Cloning..."
    git clone -v --progress https://github.com/RAprogramm/NEVIRAIDE.git $HOME/.config/nvim
}

# Save old neovim config to .old directory
rename_Dir() {
    mv $HOME/.config/nvim $HOME/.config/nvim.old
    echo "Your current configuration of Neovim save in ~/.config/nvim.old"
}

# Check is program install or not and print message
# Arguments:
#   name - name of the program
check() {
    name=$1
    have="echo -e \t✅ $name installed"
    not_have="echo -e \t❌ $name not installed"
    case $name in
        "neo") if command -v $name >/dev/null; then $have; else $not_have; READY=false; fi;;
        "nonicons") if fc-list | grep $name >/dev/null; then $have; else $not_have; READY=false; fi;;
        *) if which $name >/dev/null; then $have; else $not_have; READY=false; fi;;
    esac
}

check_dependencies() {
    echo "  Checking requirements for correct work:"
    check nvim
    check kitty
    check git
    check npm
    check lazygit
    check $FD
    check rg
    check unzip
    check delta
    check nonicons
    check neo
}

nonicons_support() {
    INSERT=`echo "
    kitty_mod super+shift
    diff_cmd auto
    initial_window_width  1600
    initial_window_height 850
    map shift+insert paste_from_clipboard
    map ctrl+shift+c copy_to_clipboard
    map ctrl+shift+v paste_from_clipboard
    font_family      JetBrains Mono Regular
    bold_font        JetBrains Mono Bold
    italic_font      JetBrains Mono Italic
    bold_italic_font JetBrains Mono SemiBold Italic
    font_size 14.0
    symbol_map U+f101-U+f25c nonicons
    cursor none
    cursor_text_color background
    cursor_shape beam
    remember_window_size no
    draw_minimal_borders yes
    active_border_color #98be65
    inactive_border_color #1f2329
    inactive_text_alpha 0.7
    tab_bar_edge top
    active_tab_foreground   #98be65
    active_tab_background   #262627
    tab_bar_background none
    active_tab_font_style   bold-italic
    inactive_tab_foreground #444
    inactive_tab_background #262627
    tab_bar_min_tabs                2
    background            #262627
    # selection line
    color0   #24252f
    color8   #5d677a
    # red
    color1   #ec5f67
    color9   #ff2c49
    # green
    color2   #98be65
    color10  #98ff30
    # yellow
    color3   #ECBE7B
    color11  #ffdf39
    # blue
    color4  #51afef
    color12 #517cff
    # magenta
    color5   #c678dd
    color13  #b986ff
    # cyan
    color6   #008080
    color14  #00bd96
    # white
    color7   #dcdfe4
    color15  #e3e3e3
    shell .
    editor nvim
    " >> $HOME/.config/kitty/kitty.conf`

    if [[ `which kitty` ]]; then
        $INSERT
    else
        curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin installer=nightly
        sudo ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
        cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications
        sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop
        $INSERT
    fi
}

delta_support() {
    INSERT=`echo "
    [core]
        pager = delta
    [interactive]
        diffFilter = delta --color-only
    [delta]
        navigate = true
        light = false
    [merge]
        conflictstyle = diff3
    [diff]
        colorMoved = default
        " >> $HOME/.gitconfig`

    if [[ `which delta` ]] && [[ `which git` ]] ; then
        $INSERT
    else
        $INSTALL delta
        $INSERT
    fi
}

install_start() {
    echo "      Installing NEVIRAIDE..."
    rename_Dir
    clone
    echo "NEVIRAIDE has been installed! 🎉"
}

echo "      GREETEENGS!"
echo "Now will be install NEVIRAIDE."
check_dependencies
nonicons_support
delta_support
if $READY; then
    echo "  All prepared for installation! 👍"
    install_start
else
    echo "Dependecies are not installed!"
fi

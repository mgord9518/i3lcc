#!/bin/bash

# Quick and dirty installer script for i3lcc
# Needs a lot of tweaking and error handling but it works

# Variables
ROOTINSTALLPATH=/usr/local/
USERINSTALLPATH=~/.local/

# Define what should be in the desktop entry
#DESKTOPFILE='[Desktop Entry]
#Type=Application
#Version=1.0
#Name=i3lcc
#Comment=Configuration program for i3lock-color
#Exec=
#Icon=i3lcc
#Terminal=false
#Categories=Application;Utility;'

# Set color vars to their ANSI values
W="\e[0;0m"
R="\e[0;31m"
G="\e[0;32m"
Y="\e[0;33m"
B="\e[0;34m"
C="\e[0;36m"

echo -e "${G}i3lcc install script"

setup() {
    echo -ne "${B} > ${W}Would you like to continue the install to [${C}${INSTALLPATH}${W}]? (Y/n): "
    read option
    if [ $option == 'y' ] || [ $option == 'Y' ]; then
        install_all
    elif [ $option == 'n' ] || [ $option == 'N' ]; then
        echo -e "${G} > ${W}Quitting without install; no changes made."
    else
        echo -e "${Y} > ${W}Unknown option!"
        setup
    fi
}

uninstall_setup() {
    echo -ne "${B} > ${W}Previous install found, would you like to [R]emove it, [U]pgrade or [C]ancel? (R/u/c): "
    read option
    if [ $option == 'r' ] || [ $option == 'R' ]; then
        echo -ne "${B} > ${W}Would you also like to remove saved configs? (Y/n): "
        read option
        echo -e "${G} > ${W}Removing i3lcc..."
        [ $option == 'y' ] || [ $option == 'Y' ] && rm -rf ~/.config/i3lcc
        rm -rf  $INSTALLPATH/bin/i3lcc \
                $INSTALLPATH/share/i3lcc
        [ $? -eq 0 ] && echo -e "${G} > ${W}Removal complete!"
        exit 0
    elif [ $option == 'u' ] || [ $option == 'U' ]; then
        echo -e "${G} > ${W}Quitting without install; no changes made."
    else
        echo -e "${Y} > ${W}Unknown option!"
    fi
}

install_all() {
    echo -e "${G} > ${W}Downloading i3lcc..."
    git clone https://github.com/mgord9518/i3lcc.git --quiet
    if [ ! ${?} = 0 ]; then
        echo -e "${R} > ERROR:${W} Failed to download i3lcc (make sure you're connected to the internet). Check out.log"
        exit 1
    fi

    cp -r i3lcc/bin/ $INSTALLPATH
    cp -r i3lcc/share/ $INSTALLPATH

    rm -rf i3lcc/

    chmod +x $INSTALLPATH/bin/i3lcc
    chmod +x $INSTALLPATH/share/i3lcc/run.bash

    echo -e "${G} > ${W}Install complete!"
}

if [ $EUID == 0 ]; then
    echo -e "${G} > ${W}Superuser permissions granted; installing as system."
    INSTALLPATH=$ROOTINSTALLPATH
else
    echo -e "${G} > ${W}No superuser permissions granted; installing as user."
    INSTALLPATH=$USERINSTALLPATH
fi

[ -f $INSTALLPATH/bin/i3lcc ] && uninstall_setup
setup

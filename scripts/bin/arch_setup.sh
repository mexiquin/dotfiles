#!/usr/bin/env bash

bold="\e[1;36m"
close="\e[0m"

git_dir=~/Git

if [ ! -d $git_dir ]; then
	mkdir $git_dir
fi

# install the mac cursor to .icons
function inscursor {
cd ~/Downloads || exit
git clone https://github.com/douglascomim/MacOSMOD.git

sudo mv ~/Downloads/MacOSMOD/ /usr/share/icons/
cd || exit
}

# Install YAY for vanilla arch
function insyay {
	if ! [ -x "$(command -v yay)" ]; then
		pacman -S --needed git base-devel
		git clone https://aur.archlinux.org/yay.git $git_dir
		cd yay || exit
		makepkg -si
	fi
}

# full arch-based linux setup
function yayinstall {

    # apt apps that need to be installed
    AppList=(bpytop 
        firefox 
        noto-fonts 
        noto-fonts-emoji 
        openssh 
        pulseaudio 
        pulseaudio-bluetooth 
        reflector 
        spotify 
        stow 
        sudo 
        base-devel 
        dconf-editor 
        grub-customizer 
        tree 
        neofetch 
        neovim 
        zsh 
        git 
        curl 
        wget 
        visual-studio-code-bin 
        remmina 
        timeshift 
        zsh-autosuggestions 
        zsh-syntax-highlighting 
        pamac-aur 
        pamac-tray-icon-plasma)

    yay -S --needed ${AppList[*]}
}



# Alright, now that all the functions are made, lets get to the install script

# Install Yay to start
insyay

# Install all apps
yayinstall

# ins the cursor
inscursor



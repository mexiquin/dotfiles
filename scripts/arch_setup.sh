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


function wal_persist {
	echo "wal -R" >> ~/.xinitrc
}

# full arch-based linux setup
function yayinstall {
# apt apps that need to be installed
AppList=(lxappearance nitrogen i3-gaps picom blueman bpytop firefox lightdm lightdm-gtk-greeter-settings lightdm-gtk-greeter noto-fonts noto-fonts-emoji openssh pavucontrol pulseaudio pulseaudio-bluetooth qogir-icon-theme-git reflector spotify sshfs stow sudo base-devel python-pywal dconf-editor grub-customizer rofi dunst tlp tree neofetch neovim zsh git curl powertop wget xfce4-terminal alacritty variety visual-studio-code-bin remmina gpick polybar pcmanfm timeshift thunderbird zsh-autosuggestions zsh-syntax-highlighting pamac-aur xfce4-power-manager clipit)

yay -S --needed ${AppList[*]}
}

function gogh {

	# change terminal colors with gogh
	bash -c  "$(wget -qO- https://git.io/vQgMr)"

}



# Alright, now that all the functions are made, lets get to the install script

# Install Yay to start
insyay

# Install all apps
yayinstall

# ins the cursor
inscursor

# Append to the end of .xinitrc for pywal color persistance
wal_persist



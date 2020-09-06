#!/usr/bin/env bash

bold="\e[1;36m"
close="\e[0m"

# install the san francisco fonts
function inssanfran {
yay -S otf-san-francisco
}

# install the mac cursor to .icons
function inscursor {
cd ~/Downloads
git clone https://github.com/douglascomim/MacOSMOD.git

if [ ! -d ~/.icons ]; then
mkdir ~/.icons
fi

mv ~/Downloads/MacOSMOD/ ~/.icons/
cd
}

# install zsh plugins (zsh autosuggestions and zsh syntax highlighting
function zshcustom {
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo -e "Dont forget to add:\n${bold}zsh-syntax-highlighting zsh-autosuggestions${close}\nto zshrc"
}

function insmenlo {
yay -S ttf-menlo-powerline-git
}

# full arch-based linux setup
function yayinstall {
# apt apps that need to be installed
AppList=(picom otf-san-francisco ttf-menlo-powerline-git dconf-editor grub-customizer rofi dunst tlp tree neofetch neovim zsh git curl powertop wget xfce4-terminal variety visual-studio-code-bin remmina gpick i3-gaps i3status)

for app in "${AppList[@]}"
do
echo "Installing ${app}"
yay -S $app
done

# change terminal colors with gogh
# bash -c  "$(wget -qO- https://git.io/vQgMr)" 

# install oh my zsh
if [ ! -d ~/.oh-my-zsh ]; then
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
}

function help {
    echo ""
    statements=("Yay Setup Commands:" "${bold}inscursor${close} -- Installs macosx cursor theme" "${bold}insmenlo${close} -- installs menlo font" "${bold}yayinstall${close} -- Installs full arch setup" "${bold}zshcustom${close} -- Install all the zsh autosuggestion and syntax highlighting" "${bold}inssanfran${close} -- Install the San Francisco font")
    for items in "${statements[@]}"
    do
    echo -e $items
    done
    echo ""
}

"$@"
